import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';

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
              SizedBox(height: 15.h),
              _buildStackLine(context),
              SizedBox(height: 13.h),
              Text(
                "Username ",
                style: CustomTextStyles.titleSmallSemiBold,
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMdiInvite,
                    height: 19.h,
                    width: 18.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5.h,
                      bottom: 2.h,
                    ),
                    child: Text(
                      "member since 25 12 2023",
                      style: CustomTextStyles.bodySmallBlack900,
                    ),
                  )
                ],
              ),
              SizedBox(height: 39.h),
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
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      decoration: AppDecoration.outlineBlack900.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 3.h,
                              bottom: 5.h,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Reps",
                                  style: CustomTextStyles.bodySmallBlack900,
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  " 230",
                                  style: CustomTextStyles.labelLarge,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                            width: 40.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgGroup,
                                  height: 16.h,
                                  width: 14.h,
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(right: 11.h),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 40.h,
                                    width: 40.h,
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
                      width: 128.h,
                      margin: EdgeInsets.only(left: 18.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.h,
                        vertical: 15.h,
                      ),
                      decoration: AppDecoration.outlineBlack900.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Time spent",
                                  style: CustomTextStyles.bodySmallBlack900,
                                ),
                                SizedBox(height: 3.h),
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
                          Expanded(
                            child: Container(
                              // height: 40.h,
                              // width: 40.h,
                              // margin: EdgeInsets.only(left: 11.h),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 40.h,
                                      width: 40.h,
                                      child: CircularProgressIndicator(
                                        value: 0.5,
                                        backgroundColor:
                                            theme.colorScheme.primary,
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgMingcuteTimeLine,
                                    height: 20.h,
                                    width: 20.h,
                                    alignment: Alignment.center,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 27.h),
              _buildColumnDailySpark(context),
              SizedBox(height: 26.h),
              _buildColumnRehabPlan(context),
              SizedBox(height: 13.h),
              CustomImageView(
                imagePath: ImageConstant.imgVectorSecondarycontainer,
                height: 3.h,
                width: 7.h,
              ),
              SizedBox(height: 5.h)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackLine(BuildContext context) {
    return SizedBox(
      height: 46.h,
      width: 320.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 12.h),
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
                    onTap: () {
                      onTapImgArrowleftone(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Text(
                      "Profile",
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
        vertical: 15.h,
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
          SizedBox(height: 9.h),
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
          SizedBox(height: 9.h)
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
        vertical: 16.h,
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
          SizedBox(height: 7.h),
          Container(
            margin: EdgeInsets.only(
              left: 3.h,
              right: 2.h,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 2.h,
            ),
            decoration: AppDecoration.fillSecondaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder9,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 33.h,
                  width: 32.h,
                  margin: EdgeInsets.only(top: 2.h),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 33.h,
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
                          padding: EdgeInsets.only(bottom: 9.h),
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
                    top: 11.h,
                    bottom: 8.h,
                  ),
                  child: Text(
                    "Arms & Shoulder",
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 13.h,
                    bottom: 8.h,
                  ),
                  child: Text(
                    "25 12 2023 Sat",
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 2.h)
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
