import 'package:flutter/material.dart';
import 'package:new_untitled/component/text_field/common_text_field.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_colors.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  final TextEditingController _controller = TextEditingController();

  bool _isComment = false;

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CommonImage(
                imageSrc: AppImages.image4,
                size: 32,
                borderRadius: 50,
              ),
              12.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Helena in Gold Bar, WA",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                    CommonText(
                      text: "3 min ago",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff828282),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_horiz),
            ],
          ),
          12.height,
          Padding(
            padding: EdgeInsets.only(left: 44),
            child: Column(
              children: [
                CommonImage(imageSrc: AppImages.image5),

                CommonText(
                  text:
                      "Weekend rewind: Cabin escape, dinner in town, and whitewater rush. See more here.",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  top: 12,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ),
                6.height,
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isComment = !_isComment;
                          _focusNode.requestFocus();
                        });
                      },
                      child: CommonImage(imageSrc: AppIcons.comment),
                    ),
                    8.width,
                    CommonText(text: "5 ${AppString.comments}"),
                  ],
                ),
                if (_isComment) 8.height,
                if (_isComment)
                  CommonTextField(
                    focusNode: _focusNode,
                    controller: _controller,
                    borderRadius: 50,
                    isDense: true,
                    paddingVertical: 6,
                    hintText: AppString.writeComment,
                  ),
              ],
            ),
          ),
          32.height,
        ],
      ),
    );
  }
}
