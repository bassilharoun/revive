import 'package:flutter/material.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/core/utils/size_utils.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'widgets/ticketcard_item_widget.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStackClockOne(context),
                  SizedBox(height: 25.v),
                  Padding(
                    padding: EdgeInsets.only(left: 33.h),
                    child: Text(
                      "Neck Pain",
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Container(
                    width: 147.h,
                    margin: EdgeInsets.only(left: 38.h),
                    child: Text(
                      "Improves blood flow \nReduces muscle soreness",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodySmallBlack90011.copyWith(
                        height: 1.73,
                      ),
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 3.v,
                              bottom: 6.v,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "2",
                                  style: CustomTextStyles.bodySmallBlack90011_1,
                                ),
                                SizedBox(height: 1.v),
                                Text(
                                  "Exercises",
                                  style: CustomTextStyles.bodySmallBlack900,
                                )
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 24,
                          ),
                          SizedBox(
                            height: 39.v,
                            child: VerticalDivider(
                              width: 3.h,
                              thickness: 3.v,
                            ),
                          ),
                          Spacer(
                            flex: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 3.v,
                              bottom: 6.v,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "5",
                                  style: CustomTextStyles.bodySmallBlack90011_1,
                                ),
                                SizedBox(height: 1.v),
                                Text(
                                  "Mins",
                                  style: CustomTextStyles.bodySmallBlack900,
                                )
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 26,
                          ),
                          SizedBox(
                            height: 39.v,
                            child: VerticalDivider(
                              width: 3.h,
                              thickness: 3.v,
                            ),
                          ),
                          Spacer(
                            flex: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.v),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bignner",
                                  style: CustomTextStyles.bodySmallBlack90011_1,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: Text(
                                    "Level",
                                    style: CustomTextStyles.bodySmallBlack900,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 26.v),
                  _buildTicketCard(context),
                  SizedBox(height: 39.v),
                  Padding(
                    padding: EdgeInsets.only(left: 33.h),
                    child: Text(
                      "To view exercise:",
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 127.v,
                      width: 260.h,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgRectangle108,
                            height: 127.v,
                            width: 260.h,
                            radius: BorderRadius.circular(
                              9.h,
                            ),
                            alignment: Alignment.center,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgTelevision,
                            height: 19.v,
                            width: 80.h,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                              left: 11.h,
                              top: 13.v,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildKickStart(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackClockOne(BuildContext context) {
    return SizedBox(
      height: 309.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle93,
            height: 309.v,
            width: 360.h,
            alignment: Alignment.center,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 21.h,
              top: 33.v,
            ),
            child: CustomIconButton(
              height: 33.adaptSize,
              width: 33.adaptSize,
              alignment: Alignment.topLeft,
              child: CustomImageView(
                imagePath: ImageConstant.imgClockOnprimary,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTicketCard(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 23.h,
          right: 16.h,
        ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10.v,
            );
          },
          itemCount: 2,
          itemBuilder: (context, index) {
            return TicketcardItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildKickStart(BuildContext context) {
    return CustomElevatedButton(
      text: "Kick Start",
      margin: EdgeInsets.only(
        left: 25.h,
        right: 30.h,
        bottom: 38.v,
      ),
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }
}
