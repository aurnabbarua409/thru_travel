import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';

import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../controller/trip_controller.dart';
import '../widgets/maps.dart';
import '../widgets/trip_appbar.dart';
import '../widgets/trip_details.dart';
import '../widgets/trip_item.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: tripProfileAppBar(),
      body: GetBuilder<TripController>(
        builder: (controller) {
          return Stack(
            children: [
              maps(controller),
              !controller.isDetails
                  ? Positioned(
                    top: 280,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: Get.height,
                      width: Get.width,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        ),
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return tripItem();
                        },
                      ),
                    ),
                  )
                  : Positioned(
                    top: 200,
                    left: 0,
                    right: 0,
                    child: tripDetails(context),
                  ),
            ],
          );
        },
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 1),
    );
  }
}
