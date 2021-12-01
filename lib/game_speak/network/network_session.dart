import 'dart:convert';

import 'package:gamemoonwalk/game_speak/model/category_item.dart';
import 'package:gamemoonwalk/game_speak/model/listen_item.dart';

import 'package:http/http.dart' as http;

String baseurl = 'api.myfeel.me';

class CategoryResponse {
  Future<List<CatrgoryItem>> fetchPosts() async {
    final Uri uri = Uri.http(baseurl, '/Question/getListCategory');
    final List<CatrgoryItem> listCateParse = [];
    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> listCate = data['listCategory'];
        listCate.forEach((value) {
          Map<dynamic, dynamic> val = value;
          listCateParse.add(CatrgoryItem.fromJson(val));
        });
        return listCateParse;
      } else {
        print('not found');
        return listCateParse;
      }
    } catch (e) {
      throw e;
    }
  }
}

class QuestionResponse {
  Future<List<ListenItem>> fetchPosts() async {
    final Uri uri = Uri.http(baseurl, '/Question/getMyQuestionMini/1');
    final List<ListenItem> listListenParse = [];
    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> listListen = data['data'];
        listListen.forEach((value) {
          Map<dynamic, dynamic> val = value;
          listListenParse.add(ListenItem.fromJson(val));
        });
        return listListenParse;
      } else {
        print('not found');
        return listListenParse;
      }
    } catch (e) {
      throw e;
    }
  }
}
