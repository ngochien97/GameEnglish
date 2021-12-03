import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turtle_game/constants/app_colors.dart';
import 'package:turtle_game/pages/details/presentation/views/components/container_result.dart';

class QuestionAnswerTile extends StatelessWidget {
  final String? question;
  final String? answerOne;
  final String? answerTwo;
  final VoidCallback? onPressOne;
  final VoidCallback? onPressTwo;

  const QuestionAnswerTile({Key? key, this.question, this.answerOne, this.answerTwo, this.onPressOne, this.onPressTwo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.49,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              question ?? "",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
              ),
              maxLines: 6,
            ),
          ),
          SizedBox(height: Get.height * 0.18),
          // Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: onPressOne,
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.black),
                    color: AppColors.white,
                  ),
                  child: Center(
                    child: Text(answerOne ?? "", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: AppColors.black),),
                  ),
                ),
              ),
              InkWell(
                onTap: onPressTwo,
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.black),
                    color: AppColors.white,
                  ),
                  child: Center(
                    child: Text(answerTwo ?? "", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: AppColors.black),),
                  ),
                ),
              )
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
