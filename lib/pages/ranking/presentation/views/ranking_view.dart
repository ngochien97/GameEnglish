import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:turtle_game/base/base_widget.dart';
import 'package:turtle_game/constants/app_colors.dart';
import 'package:turtle_game/constants/images.dart';
import 'package:turtle_game/pages/ranking/presentation/controllers/ranking_controller.dart';
import 'package:turtle_game/pages/ranking/presentation/views/components/medal_tile.dart';
import 'package:turtle_game/pages/ranking/presentation/views/components/number_rank.dart';

import 'components/rank_tile.dart';

class RankingView extends GetView<RankingController>{
  const RankingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      hasBackgroundImage: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 16, bottom: 10),
              child: InkWell(
                onTap: () {
                  Get.back(canPop: true);
                },
                child: SvgPicture.asset(
                  Images.btn_back,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
            GetBuilder<RankingController>(
              init: Get.find<RankingController>(),
              global: false,
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MedalTile(
                    onPress: () {
                      controller.rank.value = "1";
                      controller.confirmRank();
                      controller.getListRankByType(controller.rank.value);
                    },
                    name: "Iron",
                    img: Images.medal_1,
                    height: controller.rank.value == "1" ? 70 : 52,
                    width: controller.rank.value == "1" ? 70 : 52,
                    bottom: controller.rank.value == "1" ? 11 : 6,
                    left: controller.rank.value == "1" ? 25 : 17,
                  ),
                  MedalTile(
                    onPress: () {
                      controller.rank.value = "2";
                      controller.confirmRank();
                      controller.getListRankByType(controller.rank.value);
                    },
                    name: "Bronze",
                    img: Images.medal_6,
                    height: controller.rank.value == "2" ? 70 : 52,
                    width: controller.rank.value == "2" ? 70 : 52,
                    bottom: controller.rank.value == "2" ? 11 : 6,
                    left: controller.rank.value == "2" ? 20 : 10,
                  ),
                  MedalTile(
                    onPress: () {
                      controller.rank.value = "3";
                      controller.confirmRank();
                      controller.getListRankByType(controller.rank.value);
                    },
                    name: "Silver",
                    img: Images.medal_4,
                    height: controller.rank.value == "3" ? 70 : 52,
                    width: controller.rank.value == "3" ? 70 : 52,
                    bottom: controller.rank.value == "3" ? 11 : 6,
                    left: controller.rank.value == "3" ? 22 : 13,
                  ),
                  MedalTile(
                    onPress: () {
                      controller.rank.value = "4";
                      controller.confirmRank();
                      controller.getListRankByType(controller.rank.value);
                    },
                    name: "Gold",
                    img: Images.medal_light_3,
                    height: controller.rank.value == "4" ? 70 : 52,
                    width: controller.rank.value == "4" ? 70 : 52,
                    bottom: controller.rank.value == "4" ? 11 : 6,
                    left: controller.rank.value == "4" ? 24 : 15,
                  ),
                  MedalTile(
                    onPress: () {
                      controller.rank.value = "5";
                      controller.confirmRank();
                      controller.getListRankByType(controller.rank.value);
                    },
                    name: "Platinum",
                    img: Images.medal_5,
                    height: controller.rank.value == "5" ? 70 : 52,
                    width: controller.rank.value == "5" ? 70 : 52,
                    bottom: controller.rank.value == "5" ? 11 : 6,
                    left: controller.rank.value == "5" ? 15 : 7,
                  ),
                  MedalTile(
                    onPress: () {
                      controller.rank.value = "6";
                      controller.confirmRank();
                      controller.getListRankByType(controller.rank.value);
                    },
                    name: "Diamond",
                    img: Images.medal_2,
                    height: controller.rank.value == "6" ? 70 : 52,
                    width: controller.rank.value == "6" ? 70 : 52,
                    bottom: controller.rank.value == "6" ? 11 : 6,
                    left: controller.rank.value == "6" ? 14 : 6,
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height * 0.8,
              width: Get.width,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Activities & Event',
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  // Text(
                  //   'BXH thay đổi',
                  //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.gray),
                  // ),
                  // Text(
                  //   '(07 : 24 : 60 : 60s)',
                  //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.gray),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      color: AppColors.black,
                      thickness: 1.5,
                    ),
                  ),
                  GetBuilder<RankingController>(
                      init: Get.find<RankingController>(),
                      global: false,
                      builder: (controller) {
                        return Container(
                            height: Get.height * 0.62,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(
                                itemCount: controller.listRankByType.length == 0 ? 0 : controller.listRankByType.length,
                                itemBuilder: (context, index) {
                                  final item = controller.listRankByType[index];
                                  return RankTile(
                                    index: index,
                                    avatar: Images.temp,
                                    name: item?.name,
                                    kn: item?.score,
                                  );
                                }),
                          );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
