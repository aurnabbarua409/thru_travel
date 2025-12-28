import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/features/profile/presentation/controller/profile_controller.dart';

import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../utils/constants/app_icons.dart';
import '../../../trip/presentation/widgets/pop_up.dart';

AppBar profileAppbar(BuildContext context, ProfileController controller) {
  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    title: CommonText(
      text: controller.user.value?.name ?? "N/A",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.zero,
        icon: CommonImage(imageSrc: AppIcons.users),
        onPressed: () => Get.toNamed(AppRoutes.friend),
      ),
      InkWell(
        child: CommonImage(imageSrc: AppIcons.add),
        onTap: () {
          PopupController().showAdd(
            context,
            top: 80.h,
            right: 20.w,
            list: controller.options,
            onTap: controller.onChangeOption,
          );
        },
      ),
      IconButton(
        padding: EdgeInsets.zero,
        icon: CommonImage(imageSrc: AppIcons.settings),
        onPressed: () => Get.toNamed(AppRoutes.setting),
      ),
    ],
  );
}
