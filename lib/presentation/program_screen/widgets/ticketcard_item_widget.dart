import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';

class TicketcardItemWidget extends StatelessWidget {
  const TicketcardItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 29.h,
          vertical: 4.h,
        ),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgTicket,
              height: 73.h,
              width: 43.h,
              margin: EdgeInsets.only(
                left: 3.h,
                top: 3.h,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgLaptop,
              height: 74.h,
              width: 44.h,
              margin: EdgeInsets.only(
                left: 12.h,
                top: 2.h,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 6.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Standing shoulder",
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(height: 6.h),
                  Padding(
                    padding: EdgeInsets.only(left: 3.h),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgArmMuscle,
                          height: 12.h,
                          width: 13.h,
                          margin: EdgeInsets.only(bottom: 2.h),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "No Equipment",
                            style: CustomTextStyles.bodySmall11,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgClock,
                        height: 16.h,
                        width: 19.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Text(
                          "3 min | 5 set",
                          style: CustomTextStyles.bodySmall11,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
