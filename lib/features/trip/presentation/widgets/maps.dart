import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/google_map/google_map.dart';
import 'package:new_untitled/component/pop_up/common_pop_menu.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../controller/trip_controller.dart';

Widget maps(TripController controller, {bool isFilter = true}) {
  return Column(
    children: [
      8.height,
      if (isFilter)
        Row(
          children: [
            16.width,
            Container(
              padding: EdgeInsets.only(left: 12.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffE6E6E6)),
              ),
              child: Row(
                children: [
                  CommonText(text: AppString.filter, color: Color(0xff1A1A1A)),
                  PopUpMenu(
                    items: controller.filters,
                    selectedItem: [controller.selectedFilter],
                    onTap: controller.onChangeFilter,
                    iconColor: AppColors.black,
                    isContainer: false,
                  ),
                ],
              ),
            ),
            8.width,
            Container(
              padding: EdgeInsets.only(left: 12.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffE6E6E6)),
              ),
              child: Row(
                children: [
                  CommonText(text: AppString.sort, color: Color(0xff1A1A1A)),
                  PopUpMenu(
                    items: controller.sorts,
                    selectedItem: [controller.selectedSort],
                    onTap: controller.onChangeSort,
                    iconColor: AppColors.black,
                    isContainer: false,
                  ),
                ],
              ),
            ),
            Spacer(),
            CommonText(text: "99 ${AppString.results}"),
            16.width,
          ],
        ),

      Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 400,
          width: Get.width,
          child: ShowGoogleMap(
            onTapLatLong: (value) {
              print(value);
            },
          ),
        ),
      ),
    ],
  );
}
