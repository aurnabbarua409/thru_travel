import 'package:flutter/material.dart';
import 'package:new_untitled/features/profile/presentation/controller/profile_controller.dart';

import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_images.dart';

Widget personalInfo(ProfileController controller) {
  return Column(
    children: [
      /// User Profile Image here
      CommonImage(imageSrc: AppImages.image1),

      /// User Name here
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonText(
              text: "Seattle WA",
              fontSize: 11,
              fontWeight: FontWeight.w500,
              top: 23,
              left: 6,
            ),
            Divider(),
            const CommonText(
              text: "“Wandering through Washington”",
              fontSize: 11,
              fontWeight: FontWeight.w400,
              left: 6,
              top: 7,
              bottom: 7,
              fontStyle: FontStyle.italic,
            ),
            Divider(),

            const CommonText(
              text: "Total Days Traveled: 1 year 2 months",
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
