// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamemoonwalk/game_speak/model/listen_item.dart';
import 'package:gamemoonwalk/game_speak/screens/summary.dart';
import 'package:gamemoonwalk/game_speak/screens/wait_screen.dart';
import 'package:gamemoonwalk/modules/extrac_widget/widget_box.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Playing extends StatefulWidget {
  const Playing({Key? key, required this.data}) : super(key: key);
  final List<ListenItem> data;

  @override
  _PlayingState createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  int index = 0;
  int count = 3;
  List<bool> checkColor = [];
  List<bool> onClicked = [];
  late Color? colorRight;
  late Color? colorWrong;
  List<Map<String, dynamic>> listQTrue = [];
  late AudioPlayer player;
  double _height = 80;
  double leap = 0;
  final FlutterTts flutterTts = FlutterTts();
  bool checkSpam = true;

  Future _speak() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    if (index < widget.data.length) {
      await flutterTts.speak('${widget.data[index].two_question}');
    }
  }

  List<Widget> renderBox() {
    List<Widget> renderListBox = [];
    for (var i = 0; i < widget.data.length; i++) {
      renderListBox.add(box(
        checkColor: checkColor[i],
        onClicked: onClicked[i],
      ));
    }
    return renderListBox;
  }

  @override
  void initState() {
    player = AudioPlayer();
    colorRight = Colors.grey[300];
    colorWrong = Colors.grey[300];
    super.initState();
    _speak();
  }

  @override
  void didChangeDependencies() async {
    for (var i = 0; i < widget.data.length; i++) {
      checkColor.add(false);
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
        checkColor[index] = true;
        _height = 200;
        leap = leap + 28;
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
        _height = 0;
        leap = leap + 28;
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
                builder: (context) => Summary(
                      listQTrue: listQTrue,
                      data: widget.data,
                    )),
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
            image: AssetImage('lib/assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WaitScreen(),
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
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Center(
                child: Text(
                  (index >= widget.data.length)
                      ? widget.data[widget.data.length - 1].two_question!
                      : widget.data[index].two_question!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: FloatingActionButton(
                  backgroundColor: Colors.white30,
                  onPressed: () {
                    _speak();
                  },
                  child: Icon(
                    Icons.mic_none,
                    size: 32,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linearToEaseOut,
                    child: Container(
                      margin: EdgeInsets.only(left: leap),
                      child: Image.asset('lib/assets/people.png'),
                    ),
                  )
                ],
              ),
              Expanded(child: Container()),
              Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.slowMiddle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        (index >= widget.data.length || count == 0)
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  if (checkSpam) {
                                    checkSpam = false;
                                    checkRight(widget.data[index].answer_one!);
                                    setState(() {
                                      if (widget.data[index].answer_one! ==
                                          widget.data[index].true_answer) {
                                        colorWrong = Colors.green;
                                      } else {
                                        colorRight = Colors.red;
                                      }
                                      Timer(Duration(milliseconds: 500), () {
                                        setState(() {
                                          colorRight = Colors.grey[300];
                                          colorWrong = Colors.grey[300];
                                          index++;
                                          _height = 80;
                                          checkSpam = true;
                                          _speak();
                                        });
                                      });
                                    });
                                  }
                                },
                                child: Container(
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
                                    setState(() {
                                      if (widget.data[index].answer_two! ==
                                          widget.data[index].true_answer) {
                                        colorWrong = Colors.green;
                                      } else {
                                        colorRight = Colors.red;
                                      }
                                      Timer(Duration(milliseconds: 500), () {
                                        setState(() {
                                          colorRight = Colors.grey[300];
                                          colorWrong = Colors.grey[300];
                                          index++;
                                          _height = 80;
                                          checkSpam = true;
                                          _speak();
                                        });
                                      });
                                    });
                                  }
                                },
                                child: Container(
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
                  ),
                ],
              ),
              SizedBox(height: _height)
            ],
          ),
        ),
      ),
    );
  }
}
