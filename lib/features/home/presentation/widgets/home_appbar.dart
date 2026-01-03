import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_untitled/features/home/presentation/controller/home_controller.dart';

import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../utils/constants/app_icons.dart';

AppBar homeAppbar(HomeController controller) {
  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    title: CommonText(
      text: controller.userName.value,
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
