import 'package:flutter/cupertino.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/features/travel_log/data/travel_log_model.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/extensions/extension.dart';
import '../../../../component/image/common_image.dart';

Widget logItem(TravelLogModel item) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 13),
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Color(0xff2F4630),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        CommonImage(
          imageSrc: item.images.first,
          borderRadius: 6,
          height: 80,
          width: 100,
        ),
        6.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: item.title,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
              CommonText(
                text:
                    "${item.date.MonthName} ${item.date.day} - ${item.endDate.MonthName} ${item.endDate.day}, ${item.endDate.year}",
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
