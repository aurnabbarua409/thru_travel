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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonImage(imageSrc: AppImages.image1),

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
          );
        },
      ),

      /// Bottom Navigation Bar Section Starts here
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 4),
    );
  }
}
