import 'package:flutter/material.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/core/utils/size_utils.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';
import '../../core/app_export.dart'; // ignore_for_file: must_be_immutable

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              SizedBox(height: 15.v),
              _buildStackLine(context),
              SizedBox(height: 13.v),
              Text(
                "Username ",
                style: CustomTextStyles.titleSmallSemiBold,
              ),
              SizedBox(height: 2.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMdiInvite,
                    height: 19.v,
                    width: 18.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5.h,
                      bottom: 2.v,
                    ),
                    child: Text(
                      "member since 25 12 2023",
                      style: CustomTextStyles.bodySmallBlack900,
                    ),
                  )
                ],
              ),
              SizedBox(height: 39.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 23.h,
                  right: 16.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 129.h,
                      padding: EdgeInsets.symmetric(vertical: 15.v),
                      decoration: AppDecoration.outlineBlack900.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 3.v,
                              bottom: 5.v,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Reps",
                                  style: CustomTextStyles.bodySmallBlack900,
                                ),
                                SizedBox(height: 3.v),
                                Text(
                                  " 230",
                                  style: CustomTextStyles.labelLarge,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgGroup,
                                  height: 16.v,
                                  width: 14.h,
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(right: 11.h),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 40.adaptSize,
                                    width: 40.adaptSize,
                                    child: CircularProgressIndicator(
                                      value: 0.5,
                                      backgroundColor:
                                          theme.colorScheme.primary,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 136.h,
                      margin: EdgeInsets.only(left: 18.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.h,
                        vertical: 15.v,
                      ),
                      decoration: AppDecoration.outlineBlack900.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 2.v,
                              bottom: 5.v,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Time spent",
                                  style: CustomTextStyles.bodySmallBlack900,
                                ),
                                SizedBox(height: 3.v),
                                Padding(
                                  padding: EdgeInsets.only(left: 6.h),
                                  child: Text(
                                    "14 h",
                                    style: CustomTextStyles.labelLarge,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            margin: EdgeInsets.only(left: 11.h),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 40.adaptSize,
                                    width: 40.adaptSize,
                                    child: CircularProgressIndicator(
                                      value: 0.5,
                                      backgroundColor:
                                          theme.colorScheme.primary,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgMingcuteTimeLine,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  alignment: Alignment.center,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 27.v),
              _buildColumnDailySpark(context),
              SizedBox(height: 26.v),
              _buildColumnRehabPlan(context),
              SizedBox(height: 13.v),
              CustomImageView(
                imagePath: ImageConstant.imgVectorSecondarycontainer,
                height: 3.v,
                width: 7.h,
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackLine(BuildContext context) {
    return SizedBox(
      height: 46.v,
      width: 320.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 12.v),
              child: SizedBox(
                width: 320.h,
                child: Divider(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 7.h),
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 8.v,
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
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.only(top: 6.v),
                    onTap: () {
                      onTapImgArrowleftone(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.v),
                    child: Text(
                      "Profile",
                      style: CustomTextStyles.labelLargeSemiBold,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgEpSetting,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    margin: EdgeInsets.only(
                      top: 6.v,
                      bottom: 4.v,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnDailySpark(BuildContext context) {
    return Container(
      width: 305.h,
      margin: EdgeInsets.only(
        left: 16.h,
        right: 1.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daily Spark",
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 9.v),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 235.h,
              margin: EdgeInsets.only(
                left: 12.h,
                right: 24.h,
              ),
              child: Text(
                "\"A positive attitude can work wonders for your health.\"  Hans Selye",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodySmallBlack900.copyWith(
                  height: 1.43,
                ),
              ),
            ),
          ),
          SizedBox(height: 9.v)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnRehabPlan(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16.h,
        right: 1.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Rehab plan",
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 7.v),
          Container(
            margin: EdgeInsets.only(
              left: 3.h,
              right: 2.h,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 2.v,
            ),
            decoration: AppDecoration.fillSecondaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder9,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 33.v,
                  width: 32.h,
                  margin: EdgeInsets.only(top: 2.v),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 33.v,
                          width: 32.h,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(
                              16.h,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 9.v),
                          child: Text(
                            "90%",
                            style: CustomTextStyles.bodySmallBlack900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 11.v,
                    bottom: 8.v,
                  ),
                  child: Text(
                    "Arms & Shoulder",
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 13.v,
                    bottom: 8.v,
                  ),
                  child: Text(
                    "25 12 2023 Sat",
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 2.v)
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
