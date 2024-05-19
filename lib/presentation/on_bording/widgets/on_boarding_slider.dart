import 'package:flutter/material.dart';
import 'package:revive/presentation/on_bording/widgets/on_boarding_card.dart';

class OnboardingSlider extends StatefulWidget {
  final List<OnboardingCard> cards = [
    OnboardingCard(
      title: 'Title 1',
      description: 'Description 1',
      imagePath: 'assets/images/img_blue_modern_gradient.png',
    ),
    OnboardingCard(
      title: 'Title 2',
      description: 'Description 2',
      imagePath: 'assets/images/img_blue_modern_gradient.png',
    ),
    OnboardingCard(
      title: 'Title 3',
      description: 'Description 3',
      imagePath: 'assets/images/img_blue_modern_gradient.png',
    ),
  ];

  // const OnboardingSlider({required this.cards});

  @override
  State<OnboardingSlider> createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(viewportFraction: 1.1);
    final PageController _controller = PageController(initialPage: 0);

    return PageView.builder(
      controller: pageController,
      onPageChanged: (value) => setState(() => _currentPage = value),
      itemCount: widget.cards.length,
      itemBuilder: (context, index) {
        final isCenterCard = index == _currentPage;
        final isLeftCard = index == _currentPage - 1;
        final isRightCard = index == _currentPage + 1;

        double scale = 1.0;
        if (isCenterCard) {
          scale = 1;
        } else if (isLeftCard || isRightCard) {
          scale = 0.8;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Transform.scale(
              scale: scale,
              child: widget.cards[index],
            ),
          ),
        );
      },
    );
  }
}
