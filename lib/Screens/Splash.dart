// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable, deprecated_member_use, unnecessary_string_interpolations, avoid_print, prefer_final_fields, must_call_super

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gamemoonwalk/modules/request/request_catrgory.dart';
import 'package:gamemoonwalk/modules/request/request_question.dart';
import 'package:gamemoonwalk/modules/model/question_item.dart';
import 'package:gamemoonwalk/modules/model/theme_item.dart';
// import 'package:gamemoonwalk/modules/netwrok/network_session.dart';
import 'package:gamemoonwalk/screens/play_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TurtleSwimming(title: 'Game MoonWalk'),
    );
  }
}

class TurtleSwimming extends StatefulWidget {
  TurtleSwimming({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TurtleSwimming> createState() => _TurtleSwimmingState();
}

class _TurtleSwimmingState extends State<TurtleSwimming> {
  List<ThemeItem> data = [];
  List<QuestionItem> dataQuestion = [];

  bool _isLoading = true;

  @override
  void didChangeDependencies() async {
    if (_isLoading) {
      data = await RequestCategory().fetchPosts();
      dataQuestion = await RequestQuestion().fetchPosts();
      print(data.toList().toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  int randomInt(
      Random random, List<int> arrRandom, List<QuestionItem> filterTopic) {
    var randomNum = random.nextInt(filterTopic.length);
    bool checkFlag = false;
    for (var i = 0; i < arrRandom.length; i++) {
      if (randomNum == arrRandom[i]) {
        checkFlag = true;
      }
    }
    if (checkFlag) {
      return randomNum = randomInt(random, arrRandom, filterTopic);
    } else {
      return randomNum;
    }
  }

  List<QuestionItem> filterTopicChoose10(int id) {
    List<QuestionItem> filterTopic = [];
    for (var i = 0; i < dataQuestion.length; i++) {
      if (dataQuestion[i].cate_id == id) {
        filterTopic.add(dataQuestion[i]);
      }
    }
    if (filterTopic.length <= 10) {
      return filterTopic;
    } else {
      List<QuestionItem> questionRandom = [];
      List<int> arrRandomIndex = [];
      var random = Random();
      int randomNum = 0;
      for (var i = 0; i < 10; i++) {
        if (arrRandomIndex.length == 0) {
          randomNum = random.nextInt(filterTopic.length);
          arrRandomIndex.add(randomNum);
        } else {
          randomNum = randomInt(random, arrRandomIndex, filterTopic);
          arrRandomIndex.add(randomNum);
        }
      }

      arrRandomIndex.forEach((element) {
        questionRandom.add(filterTopic[element]);
      });
      return questionRandom;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var item in data)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlayGame(
                                  data: filterTopicChoose10(item.id),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 40, top: 20),
                            alignment: Alignment.center,
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.lightBlue,
                                    Colors.lime,
                                    Colors.cyanAccent
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  item.TotalQuestion + 'word',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
