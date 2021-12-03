
import 'dart:convert';

import 'package:turtle_game/pages/details/enity/details_model.dart';
import 'package:turtle_game/pages/select/entity/answer_model.dart';

import '../../../shared/api_client/api_client.dart';
import '../../../shared/api_client/api_endpoint.dart';
import '../entity/select_model.dart';


// ignore: one_member_abstracts
abstract class SelectCategoryRepository {
  Future<SelectModel> select();

  Future<DetailsModel> details(String id);

  Future<AnswerModel> answer(String id);
}

class SelectCategoryRepositoryIml implements SelectCategoryRepository {
  final ApiClient _apiClient;

  SelectCategoryRepositoryIml(this._apiClient);
  @override
  Future<SelectModel> select() async {
    final res = await _apiClient.get(ApiEndpoint.CATEGORIES);
    return SelectModel.fromJson(jsonDecode(res.data.toString()) as Map<String, dynamic>);
  }

  @override
  Future<DetailsModel> details(String id) async {
    final res = await _apiClient.get(ApiEndpoint.getListQuestionByCategory(id));
    return DetailsModel.fromJson(jsonDecode(res.data.toString()) as Map<String, dynamic>);
  }

  @override
  Future<AnswerModel> answer(String id) async {
    final res = await _apiClient.get(ApiEndpoint.getListAnswerByCategoryAndUser(id));
    return AnswerModel.fromJson(jsonDecode(res.data.toString()) as Map<String, dynamic>);
  }

}