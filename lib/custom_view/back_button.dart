import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButton<T> extends StatelessWidget {
  final T? result;

  const BackButton({Key? key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Icon(CupertinoIcons.back),
        onPressed: () {
          Get.back(result: result);
        });
  }
}
