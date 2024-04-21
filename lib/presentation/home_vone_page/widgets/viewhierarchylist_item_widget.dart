import 'package:flutter/material.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/core/utils/size_utils.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class ViewhierarchylistItemWidget extends StatelessWidget {
  const ViewhierarchylistItemWidget({Key? key})
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
            imagePath: ImageConstant.imgRectangle115,
            height: 182.v,
            width: 305.h,
            radius: BorderRadius.vertical(
              top: Radius.circular(12.h),
            ),
          ),
          SizedBox(height: 10.v),
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
                  padding: EdgeInsets.only(bottom: 9.v),
                  child: Text(
                    "Neck Pain",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgFrame115,
                  height: 16.v,
                  width: 19.h,
                  margin: EdgeInsets.only(top: 8.v),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.h,
                    top: 9.v,
                  ),
                  child: Text(
                    "5 mins",
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 2.v),
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
                  margin: EdgeInsets.only(bottom: 1.v),
                  child: Text(
                    "Improves blood flow \nReduces muscle soreness",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallBlack900.copyWith(
                      height: 1.67,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 80.h,
                    top: 14.v,
                  ),
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
          SizedBox(height: 26.v)
        ],
      ),
    );
  }
}
