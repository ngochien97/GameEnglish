
import 'dart:convert';

import 'package:turtle_game/pages/ranking/entity/ranking_model.dart';

import '../../../shared/api_client/api_client.dart';
import '../../../shared/api_client/api_endpoint.dart';


// ignore: one_member_abstracts
abstract class EndingRepository {
  Future<RankingModel> addScore(
      String userId,
      String typeRank,
      String name,
      String score,
      String categoryId,
      );

  Future<RankingModel> updateScore(
      String userId,
      String typeRank,
      String name,
      String score,
      String categoryId,
      );

  Future<RankingModel> rank();

}

class EndingRepositoryIml implements EndingRepository {
  final ApiClient _apiClient;

  EndingRepositoryIml(this._apiClient);

  @override
  Future<RankingModel> addScore(
      String userId,
      String typeRank,
      String name,
      String score,
      String categoryId,
      ) async {
    final res = await _apiClient.post(ApiEndpoint.ADD_RANK, data: {
      "user_id": userId,
      "type_rank": typeRank,
      "name": name,
      "score": score,
      "category_id": categoryId,
    });
    return RankingModel.fromJson(jsonDecode(res.data.toString()) as Map<String, dynamic>);
  }

  @override
  Future<RankingModel> updateScore(
      String userId,
      String typeRank,
      String name,
      String score,
      String categoryId,
      ) async {
    final res = await _apiClient.post(ApiEndpoint.UPDATE_RANK, data: {
      "user_id": userId,
      "type_rank": typeRank,
      "name": name,
      "score": score,
      "category_id": categoryId,
    });
    return RankingModel.fromJson(jsonDecode(res.data.toString()) as Map<String, dynamic>);
  }

  @override
  Future<RankingModel> rank() async {
    final res = await _apiClient.get(ApiEndpoint.RANK);
    return RankingModel.fromJson(jsonDecode(res.data.toString()) as Map<String, dynamic>);
  }

}