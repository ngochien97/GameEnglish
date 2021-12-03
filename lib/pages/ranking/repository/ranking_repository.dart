
import 'dart:convert';

import 'package:turtle_game/pages/ranking/entity/ranking_model.dart';
import 'package:turtle_game/pages/select/entity/select_model.dart';

import '../../../shared/api_client/api_client.dart';
import '../../../shared/api_client/api_endpoint.dart';


// ignore: one_member_abstracts
abstract class RankingRepository {

  Future<SelectModel> category();

  Future<RankingModel> rankByType(String id);

}

class RankingRepositoryIml implements RankingRepository {
  final ApiClient _apiClient;

  RankingRepositoryIml(this._apiClient);

  @override
  Future<SelectModel> category() async {
    final res = await _apiClient.get(ApiEndpoint.CATEGORIES);
    return SelectModel.fromJson(jsonDecode(res.data.toString()) as Map<String, dynamic>);
  }

  @override
  Future<RankingModel> rankByType(String id) async {
    final res = await _apiClient.get(ApiEndpoint.getListRankByTypeRank(id));
    return RankingModel.fromJson(jsonDecode(res.data.toString()) as Map<String, dynamic>);
  }

}