import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class ExercisecardItemWidget extends StatelessWidget {
  const ExercisecardItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 42.h,
        vertical: 5.h,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgAlarm,
            height: 73.h,
            width: 43.h,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgPlay,
            height: 74.h,
            width: 44.h,
            margin: EdgeInsets.only(left: 11.h),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 9.h,
              right: 18.h,
              bottom: 4.h,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Deep Squat",
                    style: CustomTextStyles.labelLargePrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgFlashlight,
                      height: 16.h,
                      width: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 6.h,
                        top: 3.h,
                      ),
                      child: Text(
                        "Equipment",
                        style: theme.textTheme.bodySmall,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgClock,
                        height: 16.h,
                        width: 19.h,
                      ),
                      Text(
                        "3 min | 5 set",
                        style: theme.textTheme.bodySmall,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
