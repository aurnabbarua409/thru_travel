import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';

import '../../../../../component/image/common_image.dart';
import '../../../../../utils/constants/app_images.dart';
import '../controller/add_experience_controller.dart';

Widget experienceImage(AddExperienceController controller) {
  return Stack(
    children: [
      Center(
        child: CircleAvatar(
          radius: 85.sp,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child:
                controller.image != null
                    ? Image.file(
                      File(controller.image!),
                      width: 170.sp,
                      height: 170.sp,
                      fit: BoxFit.fill,
                    )
                    : const CommonImage(
                      imageSrc: AppImages.profile,
                      size: 170,
                      fill: BoxFit.fill,
                    ),
          ),
        ),
      ),

      /// image change icon here
      Positioned(
        bottom: 2,
        left: Get.width * 0.62,
        child: InkWell(
          onTap: controller.getProfileImage,
          child: CommonImage(imageSrc: AppIcons.addIcon, size: 36),
        ),
      ),
    ],
  );
}
