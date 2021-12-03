import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:turtle_game/constants/app_colors.dart';

class DialogService {
  static Future<void> showActionDialog(
    BuildContext context, {
    String? leftButtonText,
    String? rightButtonText,
    VoidCallback? onPressedLeftButton,
    VoidCallback? onPressedRightButton,
    String? title,
    String? description,
    TextStyle? titleTextStyle,
    TextStyle? descriptionTextStyle,
    TextStyle? leftButtonTextStyle,
    TextStyle? rightButtonTextStyle,
    Color? leftButtonColor,
    Color? rightButtonColor,
    Color? leftButtonTextColor,
    Color? rightButtonTextColor,
  }) {
    // show the dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    title ?? "Thông báo",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.black),
                    overflow: TextOverflow.clip,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      leftButtonText!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.green),
                    ),
                    Text(
                      "/$rightButtonText Word",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                LinearPercentIndicator(
                  width: Get.width * 0.7,
                  lineHeight: 20.0,
                  percent: int.parse(leftButtonText) /int.parse(rightButtonText!),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: AppColors.green,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: onPressedLeftButton,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Image.asset(
                  "assets/images/image_play_now.png",
                  fit: BoxFit.cover,
                ),
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
