import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/text_field/common_text_field.dart';
import 'package:new_untitled/config/route/app_routes.dart';
import 'package:new_untitled/utils/extensions/extension.dart';
import 'package:new_untitled/utils/helpers/other_helper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_icons.dart';
import '../controller/forget_password_controller.dart';
import '../../../../../../../utils/constants/app_colors.dart';
import '../../../../../../../utils/constants/app_string.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final formKey = GlobalKey<FormState>();

  /// init State here
  @override
  void initState() {
    ForgetPasswordController.instance.startTimer();
    super.initState();
  }

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

                    const CommonText(
                      text: AppString.otp,
                      bottom: 8,
                      fontSize: 16,
                      top: 21,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1E1E1E),
                    ),
                    Flexible(
                      flex: 0,
                      child: PinCodeTextField(
                        controller: controller.otpController,
                        autoDisposeControllers: false,
                        cursorColor: AppColors.black,
                        appContext: (context),
                        autoFocus: true,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8.r),

                          fieldHeight: 48.sp,
                          fieldWidth: 48.sp,
                          activeFillColor: AppColors.transparent,
                          selectedFillColor: AppColors.transparent,
                          inactiveFillColor: AppColors.transparent,
                          borderWidth: 0.5.w,
                          selectedColor: AppColors.primaryColor,
                          activeColor: AppColors.primaryColor,
                          inactiveColor: AppColors.black,
                        ),
                        length: 6,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.disabled,
                        enableActiveFill: true,
                        validator: (value) {
                          if (value != null && value.length == 6) {
                            return null;
                          } else {
                            return AppString.otpIsInValid;
                          }
                        },
                      ),
                    ),
                    CommonText(
                      text: AppString.resetPasswordConfirmation,
                      color: Color(0xff1E1E1E),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),

            /// Bottom Navigation Bar Section
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(24),
              child: CommonButton(
                titleText: AppString.continues,
                isLoading: controller.isLoadingEmail,
                buttonColor: Color(0xff2F4630),
                borderColor: AppColors.transparent,

                buttonRadius: 8,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    controller.verifyOtpRepo();
                  }
                },
              ),
            ),
          ),
    );
  }
}
