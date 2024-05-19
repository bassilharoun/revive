import 'package:flutter/material.dart';

class GetReadyScreen extends StatelessWidget {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Example'),
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: 3, // Number of pages
        itemBuilder: (context, index) {
          // Logic to determine content for each page
          return Center(
            child: Container(
              width:
                  MediaQuery.of(context).size.width * 0.8, // Adjust as needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Page $index', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  Text('Additional content on the right or left'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
