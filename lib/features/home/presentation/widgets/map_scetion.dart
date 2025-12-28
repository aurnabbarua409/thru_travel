import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/google_map/google_map.dart';
import 'package:new_untitled/features/home/presentation/controller/home_controller.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

Widget mapSection(HomeController controller) {
  return Column(
    children: [
      8.height,

      SizedBox(
        height: 400,
        width: Get.width,
        child: ShowGoogleMap(
          onTapLatLong: (value) {
            print(value);
          },
        ),
      ),
    ],
  );
}
