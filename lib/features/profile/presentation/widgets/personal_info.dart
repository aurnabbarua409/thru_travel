import 'package:flutter/material.dart';
import 'package:new_untitled/features/profile/presentation/controller/profile_controller.dart';

import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_images.dart';

Widget personalInfo(ProfileController controller) {
  if (controller.profileLoading.value) {
    return Center(child: CircularProgressIndicator.adaptive());
  }
  return Column(
    children: [
      /// User Profile Image here
      CommonImage(
        imageSrc: controller.user.value?.profile ?? AppImages.image1,
        height: 200,

        fill: BoxFit.cover,
      ),

      /// User Name here
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: controller.user.value!.address,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              top: 23,
              left: 6,
            ),
            Divider(),
            CommonText(
              text:
                  controller.user.value?.bio != null
                      ? "“${controller.user.value!.bio}”"
                      : "",
              fontSize: 11,
              fontWeight: FontWeight.w400,
              left: 6,
              top: 7,
              bottom: 7,
              fontStyle: FontStyle.italic,
            ),
            Divider(),

            CommonText(
              text: "Total Days Traveled: ${controller.user.value!.totalDays}",
              fontSize: 11,
              fontWeight: FontWeight.w500,
              top: 7,
              bottom: 7,
              left: 6,
            ),
            Divider(),
          ],
        ),
      ),
    ],
  );
}
