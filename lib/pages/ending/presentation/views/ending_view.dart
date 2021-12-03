import 'package:turtle_game/base/base_widget.dart';
import 'package:turtle_game/constants/app_colors.dart';
import 'package:turtle_game/constants/images.dart';
import 'package:turtle_game/pages/ending/presentation/controllers/ending_controller.dart';
import 'package:turtle_game/pages/ending/presentation/views/components/answer_tile.dart';
import 'package:turtle_game/pages/select/presentation/controllers/select_controller.dart';
import 'package:turtle_game/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EndingView extends GetWidget<EndingController> {
  const EndingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      hasBackgroundImage: true,
      child: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.find<SelectCategoryController>().getListCategory();
                      Get.back();
                      Get.back();
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      Images.btn_back,
                      height: 30,
                      width: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Turtle Swimming',
                    style: TextStyle(fontSize: 25, color: AppColors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14),
            Container(
              height: 110,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.white3,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                border: Border.all(color: AppColors.white),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Image.asset(
                            controller.correctAnswer == 3 ||
                                    controller.correctAnswer == 4 ||
                                    controller.correctAnswer == 5 ||
                                    controller.correctAnswer == 6 ||
                                    controller.correctAnswer == 7 ||
                                    controller.correctAnswer == 8 ||
                                    controller.correctAnswer == 9 ||
                                    controller.correctAnswer == 10
                                ? Images.image_star_yelow
                                : Images.image_star_gray,
                            width: 50,
                            height: 50,
                          )),
                      Image.asset(
                                controller.correctAnswer == 6 ||
                                controller.correctAnswer == 7 ||
                                controller.correctAnswer == 8 ||
                                controller.correctAnswer == 9 ||
                                controller.correctAnswer == 10
                            ? Images.image_star_yelow
                            : Images.image_star_gray,
                        width: 50,
                        height: 50,
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Image.asset(
                                    controller.correctAnswer == 9 ||
                                    controller.correctAnswer == 10
                                ? Images.image_star_yelow
                                : Images.image_star_gray,
                            width: 50,
                            height: 50,
                          )),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Bạn trả lời đúng ${controller.correctAnswer}/10 câu.',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25, color: AppColors.white),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.78,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7, left: 10),
                    child: Text(
                      'Báo cáo nội dung',
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: AppColors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Divider(
                      color: AppColors.black,
                      thickness: 1.5,
                    ),
                  ),
                  Container(
                    height: Get.height * 0.6,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.question!.length,
                      itemBuilder: (context, index) => AnswerTile(
                        title: controller.question![index],
                        answer: controller.answers![index],
                        icon: controller.trueFail![index] == 'true' ? Images.ic_tick : Images.ic_fail,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // InkWell(
                      //   onTap: () {
                      //     Get.back(result: Routes.SELECT);
                      //   },
                      //   child: Image.asset(
                      //     Images.btn_try_again,
                      //     height: 50,
                      //     width: 220,
                      //   ),
                      // ),
                      // SizedBox(width: 20),
                      // InkWell(
                      //   onTap: () {
                      //     Get.toNamed(Routes.RANKING);
                      //   },
                      //   child: Image.asset(
                      //     Images.btn_share,
                      //     height: 50,
                      //     width: 50,
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.RANKING);
                        },
                           child: Stack(
                             children: [
                               Image.asset(
                                 Images.ic_circle,
                                 height: 50,
                                 width: 50,
                               ),
                               Positioned(
                                 bottom: 10,
                                   left: 10,
                                   child: Icon(Icons.assessment_outlined,size: 30,color: AppColors.white,)),
                             ],
                           ),
                        ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          Get.find<SelectCategoryController>().getListCategory();
                          Get.back();
                          Get.back();
                          Get.back();
                        },
                        child: Image.asset(
                          Images.btn_play,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
