import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turtle_game/constants/app_colors.dart';
import 'package:turtle_game/constants/images.dart';
import 'package:turtle_game/pages/ranking/presentation/views/components/number_rank.dart';

class RankTile extends StatelessWidget {
  final String? name;
  final String? kn;
  final String? avatar;
  final int? index;

  const RankTile({Key? key, this.name, this.kn, this.avatar, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          index! == 0
              ? Image.asset(
                  Images.top1,
                  height: 40,
                  width: 40,
                )
              : index! == 1
                  ? Image.asset(
                      Images.top2,
                      height: 40,
                      width: 40,
                    )
                  : index == 2
                      ? Image.asset(
                          Images.top3,
                          height: 40,
                          width: 40,
                        )
                      : NumberTile(
                          num: (index! + 1).toString(),
                        ),
          Container(
            width: Get.width * 0.7,
            margin: EdgeInsets.only(top: 4, left: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CircleAvatar(
                    radius: 16,
                    child: Image.asset(avatar ?? ''),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  name ?? '',
                  style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.white, fontSize: 20),
                ),
                Spacer(),
                Stack(
                  children: [
                    Text(
                      kn ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = AppColors.black,
                      ),
                    ),
                    Text(
                      kn ?? '',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
