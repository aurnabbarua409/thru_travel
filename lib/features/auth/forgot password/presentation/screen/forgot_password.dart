import 'package:flutter/material.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import '../../../../../../../utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../utils/constants/app_icons.dart';
import '../controller/forget_password_controller.dart';
import '../../../../../../../utils/constants/app_string.dart';
import '../../../../../../../utils/helpers/other_helper.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder:
          (controller) => Scaffold(
            backgroundColor: Color(0xffCFE9C3),

            /// App Bar Section
            appBar: AppBar(backgroundColor: Color(0xffF4F2EC)),

            /// body section
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    100.height,

                    /// forget password take email for reset Password
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

                    const CommonText(
                      text: AppString.email,
                      bottom: 8,
                      fontSize: 16,
                      top: 21,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1E1E1E),
                    ),
                    CommonTextField(
                      controller: controller.emailController,
                      hintText: AppString.email,
                      validator: OtherHelper.emailValidator,
                    ),

                    // const CommonText(
                    //   text: AppString.confirmEmail,
                    //   bottom: 8,
                    //   top: 19,
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.w400,
                    //   color: Color(0xff1E1E1E),
                    // ),
                    // CommonTextField(
                    //   controller: controller.emailController,
                    //   hintText: AppString.email,
                    //   validator: OtherHelper.emailValidator,
                    // ),
                    CommonText(
                      text: AppString.forgetPasswordDetails,
                      maxLines: 5,
                      color: Color(0xff1E1E1E),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      top: 30,
                    ),
                    80.height,

                    CommonButton(
                      titleText: AppString.continues,
                      isLoading: controller.isLoadingEmail,
                      buttonColor: Color(0xff2F4630),
                      borderColor: AppColors.transparent,
                      buttonWidth: 236,
                      buttonHeight: 40,
                      buttonRadius: 4,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.forgotPasswordRepo();
                        }
                      },
                    ).center,
                  ],
                ),
              ),
            ),

            /// Bottom Navigation Bar Section
          ),
    );
  }
}
