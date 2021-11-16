// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamemoonwalk/Modules/ExtracWidget/WiggetBox.dart';
import 'package:gamemoonwalk/Modules/Model/QuestionItem.dart';
import 'package:gamemoonwalk/Modules/Request/Request_question.dart';
import 'package:gamemoonwalk/Screens/Result.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({Key? key, required this.data}) : super(key: key);
  final List<QuestionItem> data;
  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  int index = 0;
  int count = 3;
  List<bool> CheckColor = [];
  List<bool> onClicked = [];
  final bool ColorAnswer = false;
  final bool ClickAnswer = false;
  List<bool> chooseTrue = [];
  int chooseTrueNum = 0;

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
  void didChangeDependencies() async {
    for (var i = 0; i < widget.data.length; i++) {
      CheckColor.add(false);
      onClicked.add(false);
    }
    super.didChangeDependencies();
  }

  void checkRight(String answer) {
    setState(() {
      onClicked[index] = true;
    });
    if (answer == widget.data[index].true_answer) {
      setState(
        () {
          CheckColor[index] = true;
          chooseTrueNum++;
        },
      );
    } else {
      setState(() {
        count--;
      });
    }
  }

  void checkanswer() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/Asset/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(12),
                    ),
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
                  color: Colors.blue[300],
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
                height: MediaQuery.of(context).size.height * 0.20,
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
                            checkRight(widget.data[index].answer_one!);
                            setState(() {
                              index++;
                              if (index == widget.data.length || count == 0) {
                                Timer(Duration(seconds: 2), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result()),
                                  );
                                });
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              widget.data[index].answer_one!,
                              // item.answer_one,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                  (index >= widget.data.length || count == 0)
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            checkRight(widget.data[index].answer_two!);
                            setState(() {
                              index++;
                              if (index == widget.data.length || count == 0) {
                                Timer(Duration(seconds: 2), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result()),
                                  );
                                });
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: ClickAnswer
                                  ? (ColorAnswer ? Colors.green : Colors.red)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              widget.data[index].answer_two!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
