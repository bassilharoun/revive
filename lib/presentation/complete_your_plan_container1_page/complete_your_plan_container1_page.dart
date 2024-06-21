import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/routes/app_routes.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';
import '../../widgets/custom_elevated_button.dart';
import 'widgets/exercisecard_item_widget.dart';

class CompleteYourPlanContainer1Page extends StatelessWidget {
  DateTime selectedDatesFromCalendar1 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              SizedBox(height: 18.h),
              _buildRowArrowLeft(context),
              SizedBox(height: 18.h),
              Text(
                "Rehabilitation plan made by your Therapist",
                style: CustomTextStyles.bodySmall12,
              ),
              _buildCalendar(context),
              SizedBox(height: 12.h),
              _buildExerciseCard(context),
              SizedBox(height: 30.h),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.getReadyScreen,
                  );
                },
                text: "kick Start",
                margin: EdgeInsets.only(
                  left: 15.h,
                  right: 22.h,
                ),
                buttonTextStyle: CustomTextStyles.titleMediumPoppins,
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowArrowLeft(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 21.h,
        right: 25.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
        vertical: 9.h,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder22,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
            height: 24.h,
            width: 24.h,
            margin: EdgeInsets.only(top: 2.h),
            onTap: () {
              onTapImgArrowleftone(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 110.h,
              top: 4.h,
              bottom: 4.h,
            ),
            child: Text(
              "Revive",
              style: CustomTextStyles.labelLargeLexend,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCalendar(BuildContext context) {
    return SizedBox(
      height: 63.h,
      width: double.maxFinite,
      child: EasyDateTimeLine(
        initialDate: selectedDatesFromCalendar1,
        locale: 'en_US',
        headerProps: EasyHeaderProps(
          selectedDateFormat: SelectedDateFormat.fullDateDMY,
          monthPickerType: MonthPickerType.switcher,
          showHeader: false,
        ),
        dayProps: EasyDayProps(
          width: 28.h,
          height: 46.h,
        ),
        onDateChange: (selectedDate) {},
        itemBuilder:
            (context, dayNumber, dayName, monthName, fullDate, isSelected) {
          return isSelected
              ? Container(
                  width: 28.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 7.h,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(
                      5.h,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayNumber.toString(),
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Text(
                          dayName.toString(),
                          style: theme.textTheme.labelMedium!.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      )
                    ],
                  ))
              : SizedBox(
                  width: double.maxFinite,
                  child: Divider(
                    height: 2.h,
                    thickness: 2.h,
                    color: theme.colorScheme.primary,
                  ),
                );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildExerciseCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 17.h,
        right: 23.h,
      ),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 19.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return ExercisecardItemWidget();
        },
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
