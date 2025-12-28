import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_untitled/features/auth/sign%20up/presentation/widget/profile_image.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import '../../../../../../../utils/extensions/extension.dart';
import 'package:get/get.dart';
import '../../../../../component/button/common_button.dart';
import '../controller/sign_up_controller.dart';
import '../../../../../../../utils/constants/app_string.dart';
import '../widget/sign_up_all_filed.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section Starts Here
      appBar: AppBar(),

      /// Body Section Starts Here
      body: GetBuilder<SignUpController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Form(
              key: controller.signUpFormKey,
              child: Column(
                children: [
                  profileImage(controller),
                  16.height,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 24.h,
                    ).copyWith(bottom: 8.h),
                    decoration: BoxDecoration(
                      color: Color(0xffCFE9C3),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        /// All Text Filed here
                        SignUpAllField(controller: controller),

                        6.height,

                        /// Submit Button Here
                        CommonButton(
                          titleText: AppString.signUp,
                          isLoading: controller.isLoading,
                          onTap: controller.signUpUser,
                          buttonWidth: 236,
                          buttonHeight: 40,
                          borderColor: AppColors.transparent,

                          buttonColor: Color(0xff2F4630),
                        ),
                        10.height,

                        ///  Sign In Instruction here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
