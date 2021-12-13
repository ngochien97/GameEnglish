// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gamemoonwalk/modules/model/question_item.dart';
import 'package:gamemoonwalk/screens/play_game.dart';
import 'package:gamemoonwalk/screens/splash.dart';

class Result extends StatefulWidget {
  final List<Map<String, dynamic>> listQTrue;
  final List<QuestionItem> data;

  const Result({
    Key? key,
    required this.listQTrue,
    required this.data,
  }) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int totalTrue = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var item in widget.listQTrue) {
      if (int.parse('${item["right"]}') == 1) {
        totalTrue++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent,
              padding: EdgeInsets.only(top: 36),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      totalTrue < 3
                          ? 'Bạn cần cố gắng nhiều hơn!'
                          : 'Bạn đã làm tốt lắm!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 40,
                        color:
                            totalTrue / 10 >= 0.3 ? Colors.yellow : Colors.grey,
                      ),
                      Icon(Icons.star_rounded,
                          size: 40,
                          color: totalTrue / 10 >= 0.6
                              ? Colors.yellow
                              : Colors.grey),
                      Icon(
                        Icons.star_rounded,
                        size: 40,
                        color:
                            totalTrue / 10 >= 0.9 ? Colors.yellow : Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Bạn trả lời đúng $totalTrue/10 câu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 8, right: 12, top: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Báo cáo nội dung',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    height: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // 'Câu trả lời:  ${widget.listQTrue[index]['right'] == 1 ? widget.listQTrue[index]['questionObject'].true_answer : (widget.listQTrue[index]['questionObject'].true_answer == widget.listQTrue[index]['questionObject'].answer_one ? widget.listQTrue[index]['questionObject'].answer_two : widget.listQTrue[index]['questionObject'].answer_one)} ',
                                'Câu trả lời:  ${widget.listQTrue[index]['answer']}',
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                height: 0.5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          title: Text(
                            widget.listQTrue[index]['questionObject'].question,
                          ),
                          trailing: Icon(
                            widget.listQTrue[index]['right'] == 1
                                ? Icons.check
                                : Icons.close,
                            color: widget.listQTrue[index]['right'] == 1
                                ? Colors.green
                                : Colors.red,
                          ),
                        );
                      },
                      itemCount: widget.listQTrue.length,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset('lib/assets/button-bxh.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayGame(
                                data: widget.data,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset('lib/assets/button-replay.png'),
                        ),
                      ),
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
                          height: 50,
                          width: 50,
                          child: Image.asset('lib/assets/button-play.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
