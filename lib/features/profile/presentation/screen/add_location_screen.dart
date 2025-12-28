import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/text_field/common_text_field.dart';
import 'package:new_untitled/utils/extensions/extension.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_images.dart';
import '../controller/profile_controller.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section Starts here
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const CommonText(
          text: "Enos Lewis",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),

      /// Body Section Starts here
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonImage(imageSrc: AppImages.image1),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CommonText(
                            top: 12,
                            text: controller.locationController.text,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),

                          Spacer(),
                          InkWell(
                            onTap: Get.back,
                            child: Icon(Icons.arrow_back),
                          ),
                        ],
                      ),
                      16.height,
                      CommonTextField(
                        controller: controller.locationController,
                        borderRadius: 30,

                        suffixIcon: InkWell(
                          child: Icon(Icons.clear, size: 20),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),

      /// Bottom Navigation Bar Section Starts here
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 4),
    );
  }
}
