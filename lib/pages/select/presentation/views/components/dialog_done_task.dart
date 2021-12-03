import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turtle_game/constants/app_colors.dart';
import 'package:turtle_game/constants/images.dart';

class DialogDoneTask extends StatelessWidget {
  const DialogDoneTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Dialog(
      child: Container(
        height: 210,
        width: width,
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Thông báo",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25, color: AppColors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Text(
                "Bạn đã hoàn thành mục gói câu hỏi này",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.black),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: Get.back,
              child: Stack(
                children: [
                  Image.asset(Images.image_button_background,height: 40,),
                  Positioned(
                    bottom: 10,
                    left: 80,
                    child: Text(
                      "OK",
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
