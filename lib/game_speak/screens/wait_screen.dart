// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gamemoonwalk/game_speak/model/category_item.dart';
import 'package:gamemoonwalk/game_speak/model/listen_item.dart';
import 'package:gamemoonwalk/game_speak/network/network_session.dart';
import 'package:gamemoonwalk/game_speak/screens/playing.dart';
import 'package:gamemoonwalk/list_game/list_game.dart';

class WaitScreen extends StatefulWidget {
  const WaitScreen({Key? key}) : super(key: key);

  @override
  _WaitScreenState createState() => _WaitScreenState();
}

class _WaitScreenState extends State<WaitScreen> {
  List<CatrgoryItem> dataCategory = [];
  List<ListenItem> dataListen = [];

  bool _isLoading = true;

  @override
  void didChangeDependencies() async {
    if (_isLoading) {
      dataCategory = await CategoryResponse().fetchPosts();
      dataListen = await QuestionResponse().fetchPosts();
    }
    setState(() {
      _isLoading = false;
    });
  }

  int randomInt(
      Random random, List<int> arrRandom, List<ListenItem> filterTopic) {
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

  List<ListenItem> filterTopicChoose10(int id) {
    List<ListenItem> filterTopic = [];
    for (var i = 0; i < dataListen.length; i++) {
      if (dataListen[i].cate_id == id) {
        filterTopic.add(dataListen[i]);
      }
    }
    if (filterTopic.length <= 10) {
      return filterTopic;
    } else {
      List<ListenItem> questionRandom = [];
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
          padding: EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 16),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => List_game()));
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
                      Center(
                        child: Column(
                          children: [
                            for (var item in dataCategory)
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Playing(
                                              data:
                                                  filterTopicChoose10(item.id),
                                            )),
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
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
