import 'package:flutter/material.dart';
import 'package:new_untitled/features/experience/presentation/controller/add_experience_controller.dart';
import '../../../../../../utils/helpers/other_helper.dart';
import '../../../../../../utils/constants/app_string.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';

class ExperienceAllField extends StatelessWidget {
  const ExperienceAllField({super.key, required this.controller});

  final AddExperienceController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// User Name here

        /// Account Password Input here
        const CommonText(
          text: AppString.title,
          bottom: 8,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xff1E1E1E),
        ),
        CommonTextField(
          hintText: AppString.title,
          controller: controller.titleController,
          validator: OtherHelper.validator,
          isDense: true,
          paddingVertical: 10,
        ),

        const CommonText(
          text: AppString.dates,
          bottom: 8,
          fontSize: 16,
          top: 11,
          fontWeight: FontWeight.w400,
          color: Color(0xff1E1E1E),
        ),
        CommonTextField(
          hintText: AppString.dates,
          controller: controller.dateController,
          validator: OtherHelper.validator,
          isDense: true,
          paddingVertical: 10,
        ),

        /// User Email here
        const CommonText(
          text: AppString.location,
          bottom: 8,
          fontSize: 16,
          top: 11,
          fontWeight: FontWeight.w400,
          color: Color(0xff1E1E1E),
        ),
        CommonTextField(
          controller: controller.locationController,
          hintText: AppString.location,
          validator: OtherHelper.validator,
          isDense: true,
          paddingVertical: 10,
        ),

        /// User Password here
        const CommonText(
          text: AppString.link,
          bottom: 8,
          fontSize: 16,
          top: 11,
          fontWeight: FontWeight.w400,
          color: Color(0xff1E1E1E),
        ),
        CommonTextField(
          controller: controller.linkController,
          hintText: AppString.link,
          validator: OtherHelper.validator,
          isDense: true,
          paddingVertical: 10,
        ),

        /// User Confirm Password here
      ],
    );
  }
}
