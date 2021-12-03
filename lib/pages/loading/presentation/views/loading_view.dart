
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:turtle_game/base/base_widget2.dart';
import 'package:turtle_game/pages/ending/ending_model.dart';
import 'package:turtle_game/pages/loading/presentation/controllers/loading_controller.dart';
import 'package:turtle_game/routes/app_pages.dart';

class LoadingView extends GetView<LoadingController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget2(
      hasBackgroundImage: true,
      backgroundImage: "assets/images/image_background2.png",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
              child: Image.asset(
            "assets/images/image_logo.png", 
            width: Get.width - 100,
          )),
          Spacer(),
          GetBuilder<LoadingController>(
            init: Get.find<LoadingController>(),
            builder: (controller) => Center(
                child: InkWell(
                  onTap: () {
                    controller.saveUserId("1","Minh");
                    Get.toNamed(Routes.SELECT);
                    // Get.toNamed(Routes.RANKING);
                  },
                    child: Image.asset(
              "assets/images/image_play.png",
              width: 80,
              height: 80,
            ))),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
