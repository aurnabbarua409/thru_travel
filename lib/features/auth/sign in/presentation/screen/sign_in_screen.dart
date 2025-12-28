import 'package:flutter/material.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';
import '../../../../../../../config/route/app_routes.dart';
import '../../../../../../../utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../controller/sign_in_controller.dart';

import '../../../../../../../utils/constants/app_colors.dart';
import '../../../../../../../utils/constants/app_string.dart';
import '../../../../../../../utils/helpers/other_helper.dart';
import '../widgets/do_not_account.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Body Sections Starts here
      body: GetBuilder<SignInController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Log In Instruction here
                    100.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CommonText(
                          text: AppString.appName,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),

                        CommonImage(imageSrc: AppIcons.train, size: 24),
                      ],
                    ),
                    14.height,

                    /// Account Email Input here
                    Container(
                      padding: EdgeInsets.all(24.sp),
                      decoration: BoxDecoration(
                        color: Color(0xffCFE9C3),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonText(
                            text: AppString.email,
                            bottom: 8,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1E1E1E),
                          ),
                          CommonTextField(
                            controller: controller.emailController,
                            hintText: AppString.email,
                            validator: OtherHelper.emailValidator,
                          ),

                          /// Account Password Input here
                          const CommonText(
                            text: AppString.password,
                            bottom: 8,
                            top: 24,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1E1E1E),
                          ),
                          CommonTextField(
                            controller: controller.passwordController,
                            isPassword: true,
                            hintText: AppString.password,
                            validator: OtherHelper.passwordValidator,
                          ),

                          24.height,

                          /// Submit Button here
                          CommonButton(
                            titleText: AppString.signIn,
                            isLoading: controller.isLoading,
                            onTap: controller.signInUser,
                            buttonColor: Color(0xff2C2C2C),
                            borderColor: Color(0xff2C2C2C),
                            buttonRadius: 8,
                            titleColor: Color(0xffF5F5F5),
                            titleWeight: FontWeight.w400,
                          ),

                          /// Forget Password Button here
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap:
                                  () => Get.toNamed(AppRoutes.forgotPassword),
                              child: const CommonText(
                                text: AppString.forgotThePassword,
                                top: 10,

                                color: Color(0xff1E1E1E),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    13.height,

                    /// Account Creating Instruction here
                    const DoNotHaveAccount().center,
                    13.height,
                    Divider(),

                    CommonText(
                      text: AppString.or,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      top: 6,
                      bottom: 6,
                    ).center,

                    Divider(),
                    CommonButton(
                      titleText: AppString.continueWithGoogle,
                      buttonColor: Color(0xff2C2C2C),
                      borderColor: Color(0xff2C2C2C),

                      buttonRadius: 8,
                      titleColor: AppColors.white,
                      titleWeight: FontWeight.w400,
                    ),

                    6.height,
                    CommonButton(
                      titleText: AppString.continueWithApple,
                      buttonRadius: 8,
                      buttonColor: Color(0xff008EE0),
                      titleWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
