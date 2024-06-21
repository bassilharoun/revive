import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';

class ViewhierarchylistItemWidget extends StatelessWidget {
  String imagePath;
  String title;
  ViewhierarchylistItemWidget(
      {Key? key, required this.imagePath, required this.title})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 182.h,
            width: 305.h,
            radius: BorderRadius.vertical(
              top: Radius.circular(12.h),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              right: 17.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 9.h),
                  child: Text(
                    title,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgFrame115,
                  height: 16.h,
                  width: 19.h,
                  margin: EdgeInsets.only(top: 8.h),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.h,
                    top: 9.h,
                  ),
                  child: Text(
                    "5 mins",
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              right: 16.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 124.h,
                  margin: EdgeInsets.only(bottom: 1.h),
                  child: Text(
                    "Improves blood flow \nReduces muscle soreness",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallBlack900.copyWith(
                      height: 1.67,
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Text(
                    "Learn more",
                    style: CustomTextStyles.bodySmallGreen600.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 26.h)
        ],
      ),
    );
  }
}
