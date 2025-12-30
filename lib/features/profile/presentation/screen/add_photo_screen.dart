import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_untitled/utils/extensions/extension.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_images.dart';
import '../controller/profile_controller.dart';

class AddPhotoScreen extends StatelessWidget {
  const AddPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder:
          (controller) => Scaffold(
            /// App Bar Section Starts here
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: CommonText(
                text: controller.user.value?.name ?? "N/A",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

            /// Body Section Starts here
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: GestureDetector(
                    onTap: () => controller.getProfileImage(),
                    child: Center(
                      child:
                          controller.image != null
                              ? Image.file(
                                File(controller.image!),
                                fit: BoxFit.cover,
                              )
                              : CommonImage(
                                imageSrc:
                                    controller.user.value?.profile ??
                                    AppImages.image1,
                              ),
                    ),
                  ),
                ),

                16.height,
                Expanded(
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return CommonImage(
                        height: 127,
                        width: 99,
                        fill: BoxFit.fill,
                        imageSrc: AppImages.image8,
                      );
                    },
                  ),
                ),
              ],
            ),

            /// Bottom Navigation Bar Section Starts here
            bottomNavigationBar: const CommonBottomNavBar(currentIndex: 4),
          ),
    );
  }
}
