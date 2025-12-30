import 'package:flutter/material.dart';
import 'package:new_untitled/component/text_field/common_text_field.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/features/happening/data/happening_model.dart';
import 'package:new_untitled/utils/app_utils.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_colors.dart';

class PostItem extends StatefulWidget {
  const PostItem({
    super.key,
    required this.happening,
    required this.onSendComment,
  });
  final HappeningModel happening;
  final Function(String, String) onSendComment;

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
                imageSrc: widget.happening.createdBy.profile,
                size: 32,
                borderRadius: 50,
              ),
              12.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: widget.happening.title,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                    CommonText(
                      text: widget.happening.createdAt.timeAgo,
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
                CommonImage(
                  imageSrc: widget.happening.images.first,
                  height: 300,
                  width: double.infinity,
                  borderRadius: 8.0,
                  fill: BoxFit.cover,
                ),

                CommonText(
                  text: widget.happening.description,
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
                    CommonText(
                      text:
                          "${widget.happening.commentCount} ${AppString.comments}",
                    ),
                  ],
                ),
                if (_isComment) 8.height,
                if (_isComment)
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextField(
                          focusNode: _focusNode,
                          controller: _controller,
                          borderRadius: 50,
                          isDense: true,
                          paddingVertical: 6,
                          hintText: AppString.writeComment,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.onSendComment(
                            widget.happening.id,
                            _controller.text.trim(),
                          );
                          setState(() {
                            widget.happening.commentCount++;
                            _isComment = false;
                          });
                        },
                        icon: Icon(Icons.send, color: AppColors.primaryColor),
                      ),
                    ],
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
