# This Python 3 environment comes with many helpful analytics libraries installed
# It is defined by the kaggle/python Docker image: https://github.com/kaggle/docker-python
# For example, here's several helpful packages to load

import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)

# Input data files are available in the read-only "../input/" directory
# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory

import os
for dirname, _, filenames in os.walk('/kaggle/input'):
    for filename in filenames:
        print(os.path.join(dirname, filename))

# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using "Save & Run All" 
# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session

df = pd.read_csv('/kaggle/input/train-dataset/train.csv')
df.head()

df['pose'].value_counts()

from sklearn.preprocessing import LabelEncoder, MinMaxScaler
from sklearn.utils.class_weight import compute_class_weight
from sklearn.model_selection import train_test_split

encoder = LabelEncoder()
y = df['pose']
y = encoder.fit_transform(y)

class_weights = compute_class_weight(class_weight='balanced', classes=np.unique(y), y=y)
class_weights

scaler = MinMaxScaler()

X = df.drop(['pose_id', 'pose'], axis='columns')
X

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, stratify=y, shuffle=True, random_state=2022)

X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

import torch
import torchvision
from torch.utils.data import Dataset, DataLoader, SubsetRandomSampler

class ExerciseDataset(Dataset):
    def __init__(self, X, y):
        self.x = torch.from_numpy(X.astype(np.float32))
        self.y = torch.from_numpy(y.astype(np.int64))
        self.n_samples = X.shape[0]
    
    def __getitem__(self, index):
        return self.x[index], self.y[index]
    
    def __len__(self):
        return self.n_samples

train_dataset = ExerciseDataset(X_train, y_train)

batch_size = 50

train_loader = DataLoader(train_dataset, batch_size=batch_size)

from torch import nn

class NeuralNet(nn.Module):
    def __init__(self, input_size, hidden_size, num_classes):
        super(NeuralNet, self).__init__()
        self.l1 = nn.Linear(input_size, hidden_size)
        self.relu = nn.ReLU()
        self.l2 = nn.Linear(hidden_size, num_classes)
        
    def forward(self, x):
        out = self.l1(x)
        out = self.relu(out)
        out = self.l2(out)
        return out

epochs = 40
learning_rate = 0.01
hidden_size = 200

model = NeuralNet(X_train.shape[1], hidden_size, len(class_weights))

criterion = nn.CrossEntropyLoss(weight=torch.from_numpy(class_weights.astype(np.float32)))
optimizer = torch.optim.Adam(model.parameters(), lr=learning_rate)

n_total_steps = len(train_loader)

for epoch in range(epochs):
    for i, (features, labels) in enumerate(train_loader):
        outputs = model(features)
        loss = criterion(outputs, labels)

        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
        
        if (i+1) % 6 == 0:
            print(f'epoch {epoch+1} / {epochs}, step {i+1} / {n_total_steps}, loss = {loss.item():.4f}')


test_features = torch.from_numpy(X_test.astype(np.float32))
test_labels = y_test
with torch.no_grad():
    outputs = model(test_features)
    _, predictions = torch.max(outputs, 1)


from sklearn.metrics import classification_report

print(classification_report(test_labels, predictions, target_names=encoder.classes_))