import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../trip/presentation/controller/trip_controller.dart';
import '../../../trip/presentation/widgets/maps.dart';
import '../../../trip/presentation/widgets/trip_details.dart';

class ExperienceDetails extends StatelessWidget {
  const ExperienceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(),
      body: GetBuilder<TripController>(
        builder: (controller) {
          return Stack(
            children: [
              maps(controller, isFilter: false),
              // Positioned(
              //   top: 220.h,
              //   left: 0,
              //   right: 0,
              //   child: tripDetails(context),
              // ),
            ],
          );
        },
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 1),
    );
  }
}
