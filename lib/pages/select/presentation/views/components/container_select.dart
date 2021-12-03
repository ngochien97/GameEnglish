
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:turtle_game/constants/app_colors.dart';
import 'package:turtle_game/constants/images.dart';

class ContainerSelect extends StatefulWidget {
  final String? name;
  final String? wordCorrect;
  final String? wordHave;
  final VoidCallback? onPress;
  final int? index;

  const ContainerSelect({Key? key, this.name, this.wordCorrect, this.wordHave, this.onPress, this.index}) : super(key: key);

  @override
  _ContainerSelectState createState() => _ContainerSelectState();
}

class _ContainerSelectState extends State<ContainerSelect> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);

  late final Animation<Offset> animation = Tween<Offset>(begin: Offset.zero, end: Offset(0, 0.08)).animate(controller);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Row(
        children: [
          widget.index == 0 || (widget.index! & 1) == 0
              ? Spacer(
                  flex: 1,
                )
              : Spacer(
                  flex: 9,
                ),
          SlideTransition(
            position: animation,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(Images.image_button),
                ),
                Positioned(
                  top: 73,
                  left: 50,
                  child: InkWell(
                    onTap: widget.onPress,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.name ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 2.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 6),
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: widget.wordCorrect ?? '0', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.green)),
                            TextSpan(text: '/', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.black)),
                            TextSpan(
                                text: widget.wordHave ?? '500', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.black)),
                            TextSpan(text: ' Words', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.black)),
                          ])),
                        ],
                      ),
                    ),
                  ),
                ),
          //       widget.index == 0 || (widget.index! & 1) == 0
          //           ? Container()
          //           : Positioned(
          //               right: 90,
          //               bottom: -133,
          //               child: SvgPicture.asset(Images.dot_2),
          //             ),
          //       widget.index == 0 || (widget.index! & 1) != 0
          //           ? Container()
          //           : Positioned(
          //               top: -65,
          //               right: -121,
          //               child: SvgPicture.asset(Images.dot_2),
          //             ),
          //     ],
          //   ),
          // ),
          // widget.index == 0 || (widget.index! & 1) != 0
          //     ? Container()
          //     : SlideTransition(
          //         position: animation,
          //         child: Stack(
          //           children: [
          //             Container(
          //               height: 200,
          //               width: Get.width - 200,
          //             ),
          //             Positioned(
          //               top: -25,
          //               left: -110,
          //               child: SvgPicture.asset(Images.dot_2),
          //             ),
                    ],
                  ),
                ),
          widget.index == 0 || (widget.index! & 1) == 0
              ? Spacer(
                  flex: 9,
                )
              : Spacer(
                  flex: 1,
                ),
        ],
      ),
    );
  }
}
