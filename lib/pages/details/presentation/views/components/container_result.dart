import 'package:flutter/material.dart';
import 'package:turtle_game/constants/app_colors.dart';

class ContainerResult extends StatelessWidget {
  final String? result;
  final VoidCallback? onPress;

  const ContainerResult({Key? key, this.result, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.black),
          color: AppColors.white,
        ),
        child: Center(
          child: Text(result ?? "", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: AppColors.black),),
        ),
      ),
    );
  }
}
