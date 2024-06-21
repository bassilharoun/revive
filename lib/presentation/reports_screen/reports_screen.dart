import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 7.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 13.h,
                  vertical: 8.h,
                ),
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder22,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowLeft,
                      height: 24.h,
                      width: 24.h,
                      margin: EdgeInsets.only(top: 6.h),
                      onTap: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Text(
                        "Your Report",
                        style: CustomTextStyles.labelLargeSemiBold,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgEpSetting,
                      height: 20.h,
                      width: 20.h,
                      margin: EdgeInsets.only(
                        top: 6.h,
                        bottom: 4.h,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "The journey begins now! Let's track your progress together.",
              style: CustomTextStyles.labelLargeSemiBold,
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text("Back Pain Rehab Plan",
                style: CustomTextStyles.titleMedium.copyWith(
                  color: Colors.black,
                )),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder9,
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15.sp,
                          backgroundColor: appTheme.green600,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.h),
                          child: Text(
                            "Push Ups",
                            style: CustomTextStyles.titleMedium.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Duration: 30 seconds",
                          style: CustomTextStyles.labelLarge,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.repeat,
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Repetitions: 0",
                          style: CustomTextStyles.labelLarge,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(Icons.no_luggage_outlined),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "No Equipment",
                          style: CustomTextStyles.labelLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
