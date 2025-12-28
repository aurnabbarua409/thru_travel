import 'package:flutter/material.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/utils/constants/app_string.dart';


AppBar experienceAppBar() {
  return AppBar(
    title: CommonText(
      text: AppString.addExperience,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
  );
}
