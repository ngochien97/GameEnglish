import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_model.g.dart';

@CopyWith()
@JsonSerializable()
class RankingModel {
  RankingModel({this.listRanking = const [], this.status,});

  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "listRank")
  final List<Ranking>? listRanking;

  factory RankingModel.fromJson(Map<String, dynamic> json) =>
      _$RankingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RankingModelToJson(this);
}

@CopyWith()
@JsonSerializable()
class Ranking {
  Ranking({
    this.id,
    this.userId,
    this.typeRank,
    this.name,
    this.score,
    this.categoryId,
  });

  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "user_id")
  final String? userId;
  @JsonKey(name: "category_id")
  final String? categoryId;
  @JsonKey(name: "type_rank")
  final String? typeRank;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "score")
  final String? score;



  factory Ranking.fromJson(Map<String, dynamic> json) =>
      _$RankingFromJson(json);

  Map<String, dynamic> toJson() => _$RankingToJson(this);
}
