import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/core/utils/size_utils.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';
import '../../widgets/custom_elevated_button.dart';
import 'widgets/viewhierarchylist_item_widget.dart';

class HomeVonePage extends StatefulWidget {
  const HomeVonePage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeVonePageState createState() => HomeVonePageState();
}

class HomeVonePageState extends State<HomeVonePage>
    with AutomaticKeepAliveClientMixin<HomeVonePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.v),
        _buildRehabPlanColumn(context),
        SizedBox(height: 14.v),
        CustomElevatedButton(
          text: "Complete your plan",
          margin: EdgeInsets.only(
            left: 2.h,
            right: 13.h,
          ),
          buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
        ),
        SizedBox(height: 40.v),
        Padding(
          padding: EdgeInsets.only(left: 3.h),
          child: Text(
            "Recovery Programs",
            style: CustomTextStyles.titleMedium.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        SizedBox(height: 17.v),
        _buildViewHierarchyList(context),
        SizedBox(height: 31.v),
        _buildStackViewOne(context)
      ],
    );
  }

  /// Section Widget
  Widget _buildRehabPlanColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.h),
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rehab plan",
            style: CustomTextStyles.labelLarge,
          ),
          SizedBox(height: 11.v),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 9.h,
              vertical: 6.v,
            ),
            decoration: AppDecoration.fillSecondaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder9,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.v,
                  width: 30.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "50%",
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 5.v,
                    bottom: 5.v,
                  ),
                  child: Text(
                    "Arms & Shoulder",
                    style: CustomTextStyles.bodySmallBlack900_1,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.v,
                    right: 3.h,
                    bottom: 6.v,
                  ),
                  child: Text(
                    "25 12 2023 Sat",
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildViewHierarchyList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        right: 10.h,
      ),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 35.v,
          );
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return ViewhierarchylistItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildStackViewOne(BuildContext context) {
    return Container(
      height: 154.v,
      width: 315.h,
      margin: EdgeInsets.only(left: 3.h),
      decoration: AppDecoration.outlineBlack,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 154.v,
              width: 304.h,
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
                borderRadius: BorderRadius.circular(
                  12.h,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: 21.h,
                top: 17.v,
                right: 27.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Boost your recovery",
                        style: CustomTextStyles.bodySmallPrimary,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowRight,
                        height: 15.adaptSize,
                        width: 15.adaptSize,
                      )
                    ],
                  ),
                  SizedBox(height: 14.v),
                  Padding(
                    padding: EdgeInsets.only(right: 68.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.v),
                          child: Column(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgOverflowMenu,
                                height: 9.adaptSize,
                                width: 9.adaptSize,
                              ),
                              SizedBox(height: 1.v),
                              SizedBox(
                                child: Divider(),
                              ),
                              SizedBox(height: 2.v),
                              CustomImageView(
                                imagePath: ImageConstant.imgMinimize,
                                height: 16.v,
                                width: 8.h,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 3.h),
                              ),
                              SizedBox(height: 2.v),
                              SizedBox(
                                child: Divider(),
                              ),
                              SizedBox(height: 1.v),
                              CustomImageView(
                                imagePath: ImageConstant.imgVector,
                                height: 7.v,
                                width: 12.h,
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 1.h),
                              ),
                              SizedBox(height: 2.v),
                              SizedBox(
                                child: Divider(),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgIconBarChart,
                                height: 14.v,
                                width: 15.h,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Start your session.",
                                style: CustomTextStyles.bodySmallBlack900,
                              ),
                              SizedBox(height: 10.v),
                              Text(
                                "Position your device on the floor.",
                                style: CustomTextStyles.bodySmallBlack900,
                              ),
                              SizedBox(height: 10.v),
                              Text(
                                "Exercise facing toward camera.",
                                style: CustomTextStyles.bodySmallBlack900,
                              ),
                              SizedBox(height: 12.v),
                              Text(
                                "Check your report after session.",
                                style: CustomTextStyles.bodySmallBlack900,
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
          )
        ],
      ),
    );
  }
}
