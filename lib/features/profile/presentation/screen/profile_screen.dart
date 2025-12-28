import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_untitled/utils/extensions/extension.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../controller/profile_controller.dart';
import '../widgets/personal_info.dart';
import '../widgets/plans.dart';
import '../widgets/profile_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section Starts here
      appBar: profileAppbar(context, Get.find<ProfileController>()),

      /// Body Section Starts here
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [personalInfo(controller), 30.height, plans()],
            ),
          );
        },
      ),

      /// Bottom Navigation Bar Section Starts here
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 4),
    );
  }
}
