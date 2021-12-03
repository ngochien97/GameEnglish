import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:turtle_game/base/base_widget2.dart';
import 'package:turtle_game/constants/app_colors.dart';
import 'package:turtle_game/constants/images.dart';
import 'package:turtle_game/pages/details/presentation/controllers/detail_controller.dart';
import 'package:turtle_game/pages/details/presentation/views/components/container_color.dart';
import 'package:turtle_game/pages/details/presentation/views/components/container_result.dart';
import 'package:turtle_game/pages/details/presentation/views/components/question_answer_tile.dart';
import 'package:turtle_game/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turtle_game/shared/utils/dialog_loading.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget2(
      hasBackgroundImage: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<DetailController>(
            init: Get.find<DetailController>(),
            global: false,
            builder: (controller) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    Get.back(canPop: true);
                  },
                  child: Image.asset(
                    Images.image_btn_back_black,
                    width: 30,
                    height: 30,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
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
                      width: 30,
                      height: 30,
                    )),
                Image.asset(
                      controller.correctAnswer == 6 ||
                      controller.correctAnswer == 7 ||
                      controller.correctAnswer == 8 ||
                      controller.correctAnswer == 9 ||
                      controller.correctAnswer == 10
                      ? Images.image_star_yelow
                      : Images.image_star_gray,
                  width: 30,
                  height: 30,
                ),
                Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Image.asset(
                          controller.correctAnswer == 9 ||
                          controller.correctAnswer == 10
                          ? Images.image_star_yelow
                          : Images.image_star_gray,
                      width: 30,
                      height: 30,
                    )),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GetBuilder<DetailController>(
              init: Get.find<DetailController>(),
              global: false,
              builder: (controller) => Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              constraints: BoxConstraints(minWidth: 0, maxWidth: Get.width - 20),
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.blue5,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.color.length,
                  itemBuilder: (context, index) {
                        return ContainerColor(
                          // ignore: invalid_use_of_protected_member
                          colors: controller.color[index].value == "true"
                              ? AppColors.green : controller.color[index].value == "fail"
                              ? AppColors.red1 : AppColors.gray4,
                        );
                  }),
            ),
          ),
          SizedBox(
            height: Get.height * 0.15,
          ),
          Center(
            child: Image.asset(
              Images.image_turtle,
              width: 80,
              height: 80,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GetBuilder<DetailController>(
              init: Get.find<DetailController>(),
              global: false,
              builder: (controller) {
                final item = controller.arguments![controller.index.value];
                return QuestionAnswerTile(
                  question: item!.question,
                  answerOne: item.answerOne,
                  answerTwo: item.answerTwo,
                  onPressOne: () {
                      controller.checkAnswer(item.answerOne!, item.trueAnswer!);
                  },
                  onPressTwo: () {
                      controller.checkAnswer(item.answerTwo!, item.trueAnswer!);
                  },
                );
              }),
        ],
      ),
    );
  }
}
