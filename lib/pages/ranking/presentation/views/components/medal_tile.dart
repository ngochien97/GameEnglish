import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turtle_game/constants/app_colors.dart';
import 'package:turtle_game/constants/images.dart';
import 'package:turtle_game/pages/ranking/presentation/views/components/number_rank.dart';

class MedalTile extends StatelessWidget {
  final String? name;
  final String? img;
  final VoidCallback? onPress;
  final double? width;
  final double? height;
  final double? bottom;
  final double? left;

  const MedalTile({Key? key, this.name, this.img, this.onPress, this.width, this.height, this.bottom, this.left}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Stack(
        children: [
          Image.asset(
            img!,
            height: height,
            width: width,
          ),
          Positioned(
            bottom: bottom,
            left: left,
            child: Text(name!, style: TextStyle(color: AppColors.white, fontSize: 9,fontWeight: FontWeight.w700),),
          )
        ],
      ),
    );
  }
}
