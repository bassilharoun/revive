import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revive/presentation/on_bording/widgets/on_boarding_card.dart';
import 'package:revive/routes/app_routes.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_elevated_button.dart';

class OnboardingSlider extends StatefulWidget {
  final List<OnboardingCard> cards = [
    OnboardingCard(
      title: 'Title 1',
      description:
          "Experience personalized recovery plan tailored to your needs at Home.",
      imagePath: 'assets/images/onboarding_1.png',
      index: 0,
    ),
    OnboardingCard(
      title: 'Title 2',
      description:
          "Unlock your body's potential with camera-based posture analysis & voice feedback.",
      imagePath: 'assets/images/onboarding_2.png',
      index: 1,
    ),
    OnboardingCard(
      title: 'Title 3',
      description:
          "Get real-time feedback and personalized guidance on your Revive Journey.",
      imagePath: 'assets/images/onboarding_3.png',
      index: 2,
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
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 400.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                }),
            items: widget.cards.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: _currentPage == i.index ? 300.h : 200.h,
                    width: 260.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        i.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.all(48.sp),
            child: Text(
              widget.cards[_currentPage].description,
              style: theme.textTheme.titleSmall,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getDotIndicator(),
          ),
          SizedBox(height: 20.h),
          CustomElevatedButton(
            text: "Log In",
            margin: EdgeInsets.symmetric(horizontal: 40.w),
            buttonTextStyle: theme.textTheme.titleMedium!,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.loginScreen);
            },
          ),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.signupScreen);
              },
              child: Text(
                "New to Revive? Sign Up",
                style: theme.textTheme.bodyMedium!.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getDotIndicator() {
    List<Widget> children = [];
    for (int i = 0; i < widget.cards.length; i++) {
      children.add(
        Container(
          width: _currentPage == i ? 24.h : 8.h,
          height: 8.h,
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            color: _currentPage == i ? appTheme.green600 : Colors.grey,
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
      );
    }
    return children;
  }
}
