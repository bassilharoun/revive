import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'widgets/ticketcard_item_widget.dart';

class ProgramScreen extends StatelessWidget {
  String? title;
  String? imagePath;
  ProgramScreen({Key? key, this.title, this.imagePath})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStackClockOne(context),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.only(left: 33.h),
                    child: Text(
                      "$title",
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: 8.h),
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
                  SizedBox(height: 17.h),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 3.h,
                              bottom: 6.h,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "2",
                                  style: CustomTextStyles.bodySmallBlack90011_1,
                                ),
                                SizedBox(height: 1.h),
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
                            height: 39.h,
                            child: VerticalDivider(
                              width: 3.h,
                              thickness: 3.h,
                            ),
                          ),
                          Spacer(
                            flex: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 3.h,
                              bottom: 6.h,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "5",
                                  style: CustomTextStyles.bodySmallBlack90011_1,
                                ),
                                SizedBox(height: 1.h),
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
                            height: 39.h,
                            child: VerticalDivider(
                              width: 3.h,
                              thickness: 3.h,
                            ),
                          ),
                          Spacer(
                            flex: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
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
                  SizedBox(height: 26.h),
                  _buildTicketCard(context),
                  SizedBox(height: 39.h),
                  Padding(
                    padding: EdgeInsets.only(left: 33.h),
                    child: Text(
                      "To view exercise:",
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 127.h,
                      width: 260.h,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgRectangle108,
                            height: 127.h,
                            width: 260.h,
                            radius: BorderRadius.circular(
                              9.h,
                            ),
                            alignment: Alignment.center,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgTelevision,
                            height: 19.h,
                            width: 80.h,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                              left: 11.h,
                              top: 13.h,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  _buildKickStart(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackClockOne(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CustomImageView(
            imagePath: "$imagePath",
            height: 300.h,
            width: double.infinity,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 21.h,
              top: 33.h,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: theme.primaryColor,
                // size: 20.h,
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
              height: 10.h,
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
        bottom: 38.h,
      ),
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }
}
