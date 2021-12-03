import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:turtle_game/base/base_widget2.dart';
import 'package:turtle_game/constants/images.dart';
import 'package:turtle_game/pages/ending/ending_model.dart';
import 'package:turtle_game/pages/select/presentation/views/components/dialog_done_task.dart';
import 'package:turtle_game/pages/select/shared_model.dart';
import 'package:turtle_game/pages/select/presentation/controllers/select_controller.dart';
import 'package:turtle_game/routes/app_pages.dart';
import 'package:turtle_game/shared/utils/dialog_service.dart';

import 'components/container_select.dart';

class SelectView extends GetView<SelectCategoryController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget2(
      hasBackgroundImage: true,
      backgroundImage: Images.image_background2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Get.back(canPop: true);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Image.asset(
                Images.image_btn_back_black,
                width: 30,
                height: 30,
              ),
            ),
          ),
          GetBuilder<SelectCategoryController>(
              init: Get.find<SelectCategoryController>(),
              global: false,
              builder: (controller) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.listCategory.value.listCategory!.length == 0 ? 0 : controller.listCategory.value.listCategory!.length,
                      itemBuilder: (context, index) {
                        final item = controller.listCategory.value.listCategory![index];
                        final total = controller.listNumberQuestion[index];
                        final answer = controller.listNumberAnswer[index];
                        final answerDone = controller.listNumberAnswerDone[index];
                        return ContainerSelect(
                          index: int.parse(item.id ?? "0"),
                          name: item.name ?? "",
                          wordCorrect: int.parse(answer) > int.parse(total) ? total : answer,
                          wordHave: total,
                          onPress: total == answerDone ? () => Get.dialog(DialogDoneTask()) : () {
                            DialogService.showActionDialog(Get.context!, onPressedLeftButton: () async {
                              await controller.getListQuestion(item.id!);
                              EndingModel.setCategoryId(item.id!);
                              EndingModel.setQuestionShow(controller.listQuestionShow.length);
                              print('controller.listQuestionShow.length');
                              print(controller.listQuestionShow.length);
                              // ignore: invalid_use_of_protected_member
                              Get.toNamed(Routes.DETAILS, arguments: controller.listQuestionShow.value);
                            }, title: item.name ?? "", leftButtonText: answer, rightButtonText: total);
                          },
                        );
                      }),
                );
              }),
        ],
      ),
    );
  }
}
