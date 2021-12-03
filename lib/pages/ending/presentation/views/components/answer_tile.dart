import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turtle_game/constants/app_colors.dart';

class AnswerTile extends StatelessWidget {
  final String? title;
  final String? answer;
  final String? icon;

  const AnswerTile({Key? key, this.title, this.answer, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width * 0.8,
                child: Text(
                  title ?? '',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19,overflow: TextOverflow.fade),
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "Câu trả lời: ",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: AppColors.gray1),
                  ),
                  Text(
                    answer ?? "",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: AppColors.gray1),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset(
            icon ?? '',
            height: 20,
            width: 20,
          ),
        ],
      ),
    );
  }
}
