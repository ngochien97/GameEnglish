
import 'package:flutter/material.dart';
import 'package:turtle_game/constants/app_colors.dart';

class NumberTile extends StatelessWidget {
  final String? num;

  const NumberTile({Key? key, this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      alignment: Alignment.center,
      // padding: const EdgeInsets.only(left: 15, right: 15),
      child: Text(
        num ?? '',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.green,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 1.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
