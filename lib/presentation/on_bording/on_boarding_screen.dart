import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:revive/presentation/on_bording/widgets/on_boarding_slider.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: OnboardingSlider()),
        ],
      ),
    );
  }
}
