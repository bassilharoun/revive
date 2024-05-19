import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/core/utils/size_utils.dart';
import 'package:revive/presentation/home_vone_page/widgets/viewhierarchylist_item_widget.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_elevated_button.dart';
import 'package:revive/widgets/custom_image_view.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import '../home_vone_page/home_vone_page.dart';

class HomeVoneTabContainerPage extends StatefulWidget {
  const HomeVoneTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeVoneTabContainerPageState createState() =>
      HomeVoneTabContainerPageState();
}

class HomeVoneTabContainerPageState extends State<HomeVoneTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //  CustomScrollView(slivers: [
          //   SliverFillRemaining(
          // hasScrollBody: true,
          // child:
          SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.v),
              _buildHomeAppBar(context),
              SizedBox(height: 14.v),
              Padding(
                padding: EdgeInsets.only(left: 26.h),
                child: Text(
                  "Week Progress",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
              SizedBox(height: 18.v),
              _buildTabview(context),
              // HomeVonePage(),
              // Expanded(
              //   child: TabBarView(
              //     controller: tabviewController,
              //     children: [
              //       HomeVonePage(),
              //       HomeVonePage(),
              //       HomeVonePage(),
              //       HomeVonePage(),
              //       HomeVonePage(),
              //       HomeVonePage()
              //     ],
              //   ),
              // )
              SizedBox(height: 20.v),
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
                  "My Programs",
                  style: CustomTextStyles.titleMedium.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
              SizedBox(height: 17.v),
              _buildViewHierarchyList(context),
              ListView.separated(
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
              SizedBox(height: 31.v),
              _buildStackViewOne(context)
            ],
          ),
        ),
      ),
      // )
      // ]),
    );
  }

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

  /// Section Widget
  Widget _buildHomeAppBar(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 28.h,
          right: 18.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 7.v,
                bottom: 8.v,
              ),
              child: Text("Hello User",
                  style: CustomTextStyles.titleMediumPoppins.copyWith(
                    color: appTheme.black900,
                  )),
            ),
            Spacer(),
            CustomIconButton(
              height: 33.adaptSize,
              width: 33.adaptSize,
              padding: EdgeInsets.all(4.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgMynauiChat,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: CustomIconButton(
                height: 33.adaptSize,
                width: 33.adaptSize,
                padding: EdgeInsets.all(4.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgBasilNotificationOnOutline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return SizedBox(
      height: 49.v,
      width: 344.h,
      child: TabBar(
        indicatorPadding: EdgeInsets.only(right: 10),
        labelPadding: EdgeInsets.only(right: 10),
        padding: EdgeInsets.only(right: 10),
        indicatorColor: Colors.transparent,
        controller: tabviewController,
        isScrollable: true,
        tabs: [
          Tab(
            child: CircleAvatar(
              radius: 20.h,
              backgroundColor: appTheme.green600,
              child: CircleAvatar(
                radius: 16.h,
                backgroundColor: appTheme.whiteA700,
                child: Text("Sun",
                    style: CustomTextStyles.bodySmall12.copyWith(
                      color: appTheme.black900,
                    )),
              ),
            ),
          ),
          Tab(
            child: CircleAvatar(
              radius: 20.h,
              backgroundColor: appTheme.green600,
              child: CircleAvatar(
                radius: 16.h,
                backgroundColor: appTheme.whiteA700,
                child: Text("Mon",
                    style: CustomTextStyles.bodySmall12.copyWith(
                      color: appTheme.black900,
                    )),
              ),
            ),
          ),
          Tab(
            child: CircleAvatar(
              radius: 20.h,
              backgroundColor: appTheme.green600,
              child: CircleAvatar(
                radius: 16.h,
                backgroundColor: appTheme.whiteA700,
                child: Text("Tue",
                    style: CustomTextStyles.bodySmall12.copyWith(
                      color: appTheme.black900,
                    )),
              ),
            ),
          ),
          Tab(
            child: CircleAvatar(
              radius: 20.h,
              backgroundColor: appTheme.green600,
              child: CircleAvatar(
                radius: 16.h,
                backgroundColor: appTheme.whiteA700,
                child: Text("Wen",
                    style: CustomTextStyles.bodySmall12.copyWith(
                      color: appTheme.black900,
                    )),
              ),
            ),
          ),
          Tab(
            child: CircleAvatar(
              radius: 20.h,
              backgroundColor: appTheme.green600,
              child: CircleAvatar(
                radius: 16.h,
                backgroundColor: appTheme.whiteA700,
                child: Text("Thu",
                    style: CustomTextStyles.bodySmall12.copyWith(
                      color: appTheme.black900,
                    )),
              ),
            ),
          ),
          Tab(
            child: CircleAvatar(
              radius: 20.h,
              backgroundColor: appTheme.green600,
              child: CircleAvatar(
                radius: 16.h,
                backgroundColor: appTheme.whiteA700,
                child: Text("Fri",
                    style: CustomTextStyles.bodySmall12.copyWith(
                      color: appTheme.black900,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
