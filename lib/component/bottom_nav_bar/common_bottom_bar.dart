import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/services/storage/storage_services.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/log/app_log.dart';
import '../../../config/route/app_routes.dart';
import '../../../utils/constants/app_colors.dart';
import '../../features/trip/presentation/controller/trip_controller.dart';

class CommonBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CommonBottomNavBar({required this.currentIndex, super.key});
  static RxnString profileImage = RxnString(LocalStorage.myImage);
  @override
  Widget build(BuildContext context) {
    List<Widget> _list = [
      CommonImage(imageSrc: AppIcons.notification),
      CommonImage(imageSrc: AppIcons.search),
      CommonImage(imageSrc: AppIcons.home),
      CommonImage(imageSrc: AppIcons.train),
      Obx(
        () => ClipOval(
          child: CommonImage(
            imageSrc: profileImage.value ?? AppImages.profileIcon,
            size: 24.sp,
            fill: BoxFit.cover,
          ),
        ),
      ),
    ];
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_list.length, (index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: EdgeInsetsDirectional.all(12.sp),
                child: Column(children: [_list[index]]),
              ),
            );
          }),
        ),
      ),
    );
  }

  void onTap(int index) async {
    appLog(index);
    if (currentIndex == index) return;

    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.notifications);
        break;
      case 1:
        TripController.instance.isDetails = false;
        Get.toNamed(AppRoutes.trip);
        break;
      case 2:
        Get.toNamed(AppRoutes.home);
        break;
      case 3:
        Get.toNamed(AppRoutes.happening);
        break;
      case 4:
        Get.toNamed(AppRoutes.profile);
        break;
      default:
        Get.toNamed(AppRoutes.trip);
        break;
    }
  }
}
