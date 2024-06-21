import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/presentation/home_screen/widgets/program_item.dart';
import 'package:revive/presentation/program_screen/program_screen.dart';
import 'package:revive/routes/app_routes.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_elevated_button.dart';
import 'package:revive/widgets/custom_image_view.dart';
import '../../widgets/custom_icon_button.dart';

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

  List<ViewhierarchylistItemWidget> viewItemList = [
    ViewhierarchylistItemWidget(
      imagePath: "assets/images/img_rectangle_115_182x305.png",
      title: "Arms & Shoulder",
    ),
    ViewhierarchylistItemWidget(
      imagePath: "assets/images/img_rectangle_115_180x305.png",
      title: "Legs & Glutes",
    ),
    ViewhierarchylistItemWidget(
      imagePath: "assets/images/img_rectangle_108.png",
      title: "Full Body",
    ),
    ViewhierarchylistItemWidget(
      imagePath: ImageConstant.imgRectangle115,
      title: "Chest & Back",
    ),
  ];

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
              SizedBox(height: 25.h),
              _buildHomeAppBar(context),
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.only(left: 26.h),
                child: Text(
                  "Week Progress",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
              SizedBox(height: 18.h),
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
              SizedBox(height: 20.h),
              _buildRehabPlanColumn(context),
              SizedBox(height: 14.h),
              CustomElevatedButton(
                text: "Complete your plan",
                margin: EdgeInsets.only(
                  left: 2.h,
                  right: 13.h,
                ),
                buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.liveExcerciseScreen);
                },
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text(
                  "My Programs",
                  style: CustomTextStyles.titleMedium.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
              SizedBox(height: 17.h),
              _buildViewHierarchyList(context),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 35.h,
                  );
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  return;
                },
              ),
              SizedBox(height: 31.h),
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
        vertical: 16.h,
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
          SizedBox(height: 11.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 9.h,
              vertical: 6.h,
            ),
            decoration: AppDecoration.fillSecondaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder9,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
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
                    top: 5.h,
                    bottom: 5.h,
                  ),
                  child: Text(
                    "Arms & Shoulder",
                    style: CustomTextStyles.bodySmallBlack900_1,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.h,
                    right: 3.h,
                    bottom: 6.h,
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
            height: 35.h,
          );
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                // Navigator.pushNamed(context, AppRoutes.programScreen);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProgramScreen(
                      title: viewItemList[index].title,
                      imagePath: viewItemList[index].imagePath);
                }));
              },
              child: viewItemList[index]);
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildStackViewOne(BuildContext context) {
    return Container(
      height: 154.h,
      width: 315.h,
      margin: EdgeInsets.only(left: 3.h),
      decoration: AppDecoration.outlineBlack,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 154.h,
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
                top: 17.h,
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
                        height: 15.h,
                        width: 15.h,
                      )
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Padding(
                    padding: EdgeInsets.only(right: 68.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Column(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgOverflowMenu,
                                height: 9.h,
                                width: 9.h,
                              ),
                              SizedBox(height: 1.h),
                              SizedBox(
                                child: Divider(),
                              ),
                              SizedBox(height: 2.h),
                              CustomImageView(
                                imagePath: ImageConstant.imgMinimize,
                                height: 16.h,
                                width: 8.h,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 3.h),
                              ),
                              SizedBox(height: 2.h),
                              SizedBox(
                                child: Divider(),
                              ),
                              SizedBox(height: 1.h),
                              CustomImageView(
                                imagePath: ImageConstant.imgVector,
                                height: 7.h,
                                width: 12.h,
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 1.h),
                              ),
                              SizedBox(height: 2.h),
                              SizedBox(
                                child: Divider(),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgIconBarChart,
                                height: 14.h,
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
                              SizedBox(height: 10.h),
                              Text(
                                "Position your device on the floor.",
                                style: CustomTextStyles.bodySmallBlack900,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Exercise facing toward camera.",
                                style: CustomTextStyles.bodySmallBlack900,
                              ),
                              SizedBox(height: 12.h),
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
                top: 7.h,
                bottom: 8.h,
              ),
              child: Text("Hello User",
                  style: CustomTextStyles.titleMediumPoppins.copyWith(
                    color: appTheme.black900,
                  )),
            ),
            Spacer(),
            CustomIconButton(
              height: 33.h,
              width: 33.h,
              padding: EdgeInsets.all(4.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgMynauiChat,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: CustomIconButton(
                height: 33.h,
                width: 33.h,
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
      height: 49.h,
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
