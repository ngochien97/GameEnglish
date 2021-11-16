// ignore_for_file: file_names, use_rethrow_when_possible
import 'dart:convert';
import 'package:gamemoonwalk/Modules/Model/ThemItem.dart';

import 'package:http/http.dart' as http;

String baseurl = 'api.myfeel.me';

class RequestCategory {
  Future<List<ThemeItem>> fetchPosts() async {
    final Uri uri = Uri.http(baseurl, 'Question/getListCategory');
    final List<ThemeItem> listCateParse = [];
    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> listCate = data['listCategory'];
        listCate.forEach((value) {
          Map<dynamic, dynamic> val = value;
          listCateParse.add(ThemeItem.fromJson(val));
        });
        return listCateParse;
      } else {
        print('Not found');
        return listCateParse;
      }
    } catch (e) {
      print('hinh nhu la code ben tren sai');

      throw e;
    }
  }
}
