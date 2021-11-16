// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';

import 'package:gamemoonwalk/Modules/Model/QuestionItem.dart';
import 'package:http/http.dart' as http;

String baseurl = 'api.myfeel.me';

class RequestQuestion {
  Future<List<QuestionItem>> fetchPosts() async {
    final Uri uri = Uri.http(baseurl, 'question/getArrQuestion');
    final List<QuestionItem> listQuestionParse = [];
    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> listQuestion = data['data'];
        listQuestion.forEach((value) {
          Map<dynamic, dynamic> val = value;
          listQuestionParse.add(QuestionItem.fromJson(val));
        });
        return listQuestionParse;
      } else {
        print('Not found');
        return listQuestionParse;
      }
    } catch (e) {
      print('hinh nhu la code ben tren sai');
      throw e;
    }
  }
}
