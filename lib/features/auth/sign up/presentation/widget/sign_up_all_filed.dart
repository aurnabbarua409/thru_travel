import 'package:flutter/material.dart';
import '../../../../../../utils/helpers/other_helper.dart';
import '../../../../../../utils/constants/app_string.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../controller/sign_up_controller.dart';

class SignUpAllField extends StatelessWidget {
  const SignUpAllField({super.key, required this.controller});

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// User Name here

        /// Account Password Input here
        const CommonText(
          text: AppString.firstName,
          bottom: 8,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xff1E1E1E),
        ),
        CommonTextField(
          hintText: AppString.firstName,
          controller: controller.firstNameController,
          validator: OtherHelper.validator,
        ),

        const CommonText(
          text: AppString.lastName,
          bottom: 8,
          fontSize: 16,
          top: 11,
          fontWeight: FontWeight.w400,
          color: Color(0xff1E1E1E),
        ),
        CommonTextField(
          hintText: AppString.lastName,
          controller: controller.lastNameController,
          validator: OtherHelper.validator,
        ),

        /// User Email here
        const CommonText(
          text: AppString.email,
          bottom: 8,
          fontSize: 16,
          top: 11,
          fontWeight: FontWeight.w400,
          color: Color(0xff1E1E1E),
        ),
        CommonTextField(
          controller: controller.emailController,
          hintText: AppString.email,
          validator: OtherHelper.emailValidator,
        ),

        /// User Password here
        const CommonText(
          text: AppString.password,
          bottom: 8,
          fontSize: 16,
          top: 11,
          fontWeight: FontWeight.w400,
          color: Color(0xff1E1E1E),
        ),
        CommonTextField(
          controller: controller.passwordController,
          isPassword: true,
          hintText: AppString.password,
          validator: OtherHelper.passwordValidator,
        ),

        /// User Confirm Password here
        const CommonText(
          text: AppString.confirmPassword,
          bottom: 8,
          fontSize: 16,
          top: 11,
          fontWeight: FontWeight.w400,
          color: Color(0xff1E1E1E),
        ),

        CommonTextField(
          controller: controller.confirmPasswordController,
          isPassword: true,
          hintText: AppString.confirmPassword,
          validator:
              (value) => OtherHelper.confirmPasswordValidator(
                value,
                controller.passwordController,
              ),
        ),
      ],
    );
  }
}
