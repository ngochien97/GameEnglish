import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BaseWidget extends StatelessWidget {
  final Stream<bool>? loading;
  final AppBar? appBar;
  final bool? hasBackgroundImage;
  final String? backgroundImage;
  final Widget? child;

  BaseWidget({Key? key, this.loading, this.appBar, this.child, this.hasBackgroundImage, this.backgroundImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? null,
      body: SafeArea(
          child: StreamBuilder<bool>(
              stream: loading,
              builder: (context, snapshot) {
                return Stack(
                  children: [
                    (hasBackgroundImage ?? false)
                        ? Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/image_background.png"),
                            fit: BoxFit.fill),
                      ),
                    )
                        : const SizedBox.shrink(),
                    child ?? Container(),
                  ],
                );
              })),
    );
  }
}