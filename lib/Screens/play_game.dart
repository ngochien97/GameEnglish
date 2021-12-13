// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamemoonwalk/Screens/splash.dart';
import 'package:gamemoonwalk/modules/extrac_widget/widget_box.dart';
import 'package:gamemoonwalk/modules/model/question_item.dart';
import 'package:gamemoonwalk/screens/result.dart';
import 'package:just_audio/just_audio.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({Key? key, required this.data}) : super(key: key);
  final List<QuestionItem> data;
  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  late AudioPlayer player;
  int index = 0;
  int count = 3;
  List<bool> CheckColor = [];
  List<bool> onClicked = [];
  List<Map<String, dynamic>> listQTrue = [];
  late Color? colorRight;
  late Color? colorWrong;
  double _height1 = 80;
  double _height2 = 80;
  bool checkSpam = true;

  List<Widget> renderBox() {
    List<Widget> renderListBox = [];

    for (var i = 0; i < widget.data.length; i++) {
      renderListBox.add(box(
        checkColor: CheckColor[i],
        onClicked: onClicked[i],
      ));
    }
    return renderListBox;
  }

  @override
  void initState() {
    colorRight = Colors.grey[300];
    colorWrong = Colors.grey[300];
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    for (var i = 0; i < widget.data.length; i++) {
      CheckColor.add(false);
      onClicked.add(false);
    }
    super.didChangeDependencies();
  }

  void checkRight(String answer) async {
    setState(() {
      onClicked[index] = true;
    });
    if (answer == widget.data[index].true_answer) {
      Map<String, Object> question = {
        'questionObject': widget.data[index],
        'right': 1,
        'answer': answer,
      };
      listQTrue.add(question);
      setState(() {
        CheckColor[index] = true;
      });
      await player.setAsset('assets/audio/dung.mp3');
      player.play();
    } else {
      Map<String, Object> question = {
        'questionObject': widget.data[index],
        'right': 0,
        'answer': answer,
      };
      listQTrue.add(question);
      setState(() {
        count--;
      });
      await player.setAsset('assets/audio/tlsai.mp3');
      player.play();
    }
    if (index == widget.data.length - 1 || count == 0) {
      Timer(
        Duration(seconds: 2),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Result(
                listQTrue: listQTrue,
                data: widget.data,
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 32, left: 8, right: 8),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TurtleSwimming(title: ''),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red[500],
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      '$count',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                height: 33,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...renderBox(),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Center(
                child: Text(
                  (index >= widget.data.length)
                      ? widget.data[widget.data.length - 1].question!
                      : widget.data[index].question!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (index >= widget.data.length || count == 0)
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            if (checkSpam) {
                              checkSpam = false;
                              checkRight(widget.data[index].answer_one!);
                              setState(
                                () {
                                  if (widget.data[index].answer_one! ==
                                      widget.data[index].true_answer) {
                                    colorWrong = Colors.green;
                                    _height1 = 180;
                                  } else {
                                    colorRight = Colors.red;
                                    _height2 = 180;
                                  }
                                  Timer(Duration(milliseconds: 800), () {
                                    setState(() {
                                      colorRight = Colors.grey[300];
                                      colorWrong = Colors.grey[300];
                                      index++;
                                      _height1 = 80;
                                      _height2 = 80;
                                      checkSpam = true;
                                    });
                                  });
                                },
                              );
                            }
                          },
                          child: AnimatedContainer(
                            margin: widget.data[index].answer_one! ==
                                    widget.data[index].true_answer
                                ? EdgeInsets.only(bottom: _height1)
                                : EdgeInsets.only(bottom: _height2),
                            duration: Duration(milliseconds: 800),
                            curve: Curves.bounceOut,
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: widget.data[index].answer_two! ==
                                      widget.data[index].true_answer
                                  ? colorRight
                                  : colorWrong,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              widget.data[index].answer_one!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                  (index >= widget.data.length || count == 0)
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            if (checkSpam) {
                              checkSpam = false;
                              checkRight(widget.data[index].answer_two!);
                              setState(
                                () {
                                  if (widget.data[index].answer_two! ==
                                      widget.data[index].true_answer) {
                                    colorWrong = Colors.green;
                                    _height1 = 180;
                                  } else {
                                    colorRight = Colors.red;
                                    _height2 = 180;
                                  }
                                  Timer(Duration(milliseconds: 800), () {
                                    setState(() {
                                      colorRight = Colors.grey[300];
                                      colorWrong = Colors.grey[300];
                                      index++;
                                      _height1 = 80;
                                      _height2 = 80;
                                      checkSpam = true;
                                    });
                                  });
                                },
                              );
                            }
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.bounceOut,
                            margin: widget.data[index].answer_two! ==
                                    widget.data[index].true_answer
                                ? EdgeInsets.only(bottom: _height1)
                                : EdgeInsets.only(bottom: _height2),
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: widget.data[index].answer_one! ==
                                      widget.data[index].true_answer
                                  ? colorRight
                                  : colorWrong,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              widget.data[index].answer_two!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
