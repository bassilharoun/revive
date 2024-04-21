import 'package:flutter/material.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/core/utils/size_utils.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController gana0valueoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 45.h,
                  vertical: 20.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgBlueModernGradient,
                      height: 134.v,
                      width: 194.h,
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Revive",
                        style: CustomTextStyles.titleLargePrimary,
                      ),
                    ),
                    SizedBox(height: 60.v),
                    Text(
                      "Create an Account",
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 29.v),
                    Padding(
                      padding: EdgeInsets.only(right: 6.h),
                      child: CustomTextFormField(
                        controller: gana0valueoneController,
                        hintText: "username",
                        prefix: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 11.v,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.userIcon,
                            height: 18.v,
                            width: 16.h,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: 40.v,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 6.h,
                        right: 21.h,
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgPhInfoFill,
                            height: 13.adaptSize,
                            width: 13.adaptSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.h),
                            child: Text(
                              "Write unique name that never entered before.",
                              style: CustomTextStyles.bodySmallBlack900_1,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 28.v),
                    Padding(
                      padding: EdgeInsets.only(right: 6.h),
                      child: CustomTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        suffix: Container(
                          margin: EdgeInsets.only(right: 15.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.showPasswordIcon,
                            height: 16.v,
                            width: 16.h,
                          ),
                        ),
                        prefix: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 12.h,
                            vertical: 11.v,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.passwordIcon,
                            height: 18.v,
                            width: 16.h,
                          ),
                        ),
                        suffixConstraints: BoxConstraints(
                          maxHeight: 40.v,
                        ),
                        obscureText: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 11.v),
                      ),
                    ),
                    SizedBox(height: 50.v),
                    CustomElevatedButton(
                      text: "Sign Up",
                      margin: EdgeInsets.only(right: 6.h),
                      buttonTextStyle: theme.textTheme.titleMedium!,
                    ),
                    SizedBox(height: 12.v),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Already have an account ? Log In",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.v)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
