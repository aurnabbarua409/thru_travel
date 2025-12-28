import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/text/common_text.dart';
import '../controller/setting_controller.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_string.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section starts here
      appBar: AppBar(
        backgroundColor: Color(0xffCFE9C3),
        toolbarHeight: 40.h,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: true,
        title: CommonText(
          text: AppString.settings,
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: AppColors.black.withOpacity(0.7),
        ),
      ),

      /// Body Section starts here
      body: GetBuilder<SettingController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                CommonText(
                  text: AppString.preferences,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                CommonText(
                  text: AppString.preferencesDetails,
                  fontSize: 14,
                  top: 2,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black.withOpacity(0.5),
                ),

                30.height,
                CommonText(
                  text: AppString.notificationSettings,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                CommonText(
                  text: AppString.dateFormat,
                  fontSize: 14,
                  top: 2,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black.withOpacity(0.5),
                ),

                30.height,
                CommonText(
                  text: AppString.connectAppsAndIntegration,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                CommonText(
                  text: AppString.calendarSync,
                  fontSize: 14,
                  top: 2,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black.withOpacity(0.5),
                ),

                30.height,
                CommonText(
                  text: AppString.supportAndFeedback,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                CommonText(
                  text: AppString.sendFeedbackOrFeatureRequest,
                  fontSize: 14,
                  top: 2,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black.withOpacity(0.5),
                ),
              ],
            ),
          );
        },
      ),

      /// Bottom Navigation Bar Section starts here
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 0),
    );
  }
}
