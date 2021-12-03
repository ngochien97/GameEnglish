
import 'dart:convert';

import 'package:turtle_game/pages/details/enity/details_model.dart';
import 'package:turtle_game/pages/select/entity/answer_model.dart';

import '../../../shared/api_client/api_client.dart';
import '../../../shared/api_client/api_endpoint.dart';


// ignore: one_member_abstracts
abstract class LoadingRepository {

  Future<DetailsModel> details(String id);

  Future<AnswerModel> answer(String id);
}

class LoadingRepositoryIml implements LoadingRepository {
  final ApiClient _apiClient;

  LoadingRepositoryIml(this._apiClient);

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