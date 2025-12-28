import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../utils/constants/app_icons.dart';

AppBar homeAppbar() {
  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    title: const CommonText(
      text: "Enos Lewis",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.zero,
        icon: CommonImage(imageSrc: AppIcons.briefcase),
        onPressed: () => Get.toNamed(AppRoutes.travelLog),
      ),
    ],
  );
}
