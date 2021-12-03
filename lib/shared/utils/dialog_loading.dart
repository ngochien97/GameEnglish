import 'package:flutter/material.dart';
import 'package:turtle_game/constants/app_colors.dart';
import 'package:turtle_game/constants/app_dimens.dart';

class DialogLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: AppDimens.space100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Container(
        height: height * 0.12,
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.white,
              ),
            ),
            SizedBox(
              height: AppDimens.padding16,
            ),
            Text(
              'Loading...',
              style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.black, fontSize: AppDimens.textSize12),
            )
          ],
        ),
      ),
    );
  }
}