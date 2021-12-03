import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

dismissKeyboard({required BuildContext context}) {
  FocusScope.of(context).requestFocus(FocusNode());
}

showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
      fontSize: 16.0);
}

showCupertinoDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required String titleConfirm,
    required String titleCancel}) {
  showDialog(
      context: context,
      builder: (c) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(titleConfirm),
              ),
              CupertinoDialogAction(
                child: Text(titleCancel),
              )
            ],
          ));
}
