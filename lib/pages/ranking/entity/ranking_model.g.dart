// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension RankingModelCopyWith on RankingModel {
  RankingModel copyWith({
    List<Ranking>? listRanking,
    int? status,
  }) {
    return RankingModel(
      listRanking: listRanking ?? this.listRanking,
      status: status ?? this.status,
    );
  }
}

extension RankingCopyWith on Ranking {
  Ranking copyWith({
    String? categoryId,
    String? id,
    String? name,
    String? score,
    String? typeRank,
    String? userId,
  }) {
    return Ranking(
      categoryId: categoryId ?? this.categoryId,
      id: id ?? this.id,
      name: name ?? this.name,
      score: score ?? this.score,
      typeRank: typeRank ?? this.typeRank,
      userId: userId ?? this.userId,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingModel _$RankingModelFromJson(Map<String, dynamic> json) {
  return RankingModel(
    listRanking: (json['listRank'] as List<dynamic>?)
        ?.map((e) => Ranking.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as int?,
  );
}

Map<String, dynamic> _$RankingModelToJson(RankingModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'listRank': instance.listRanking,
    };

Ranking _$RankingFromJson(Map<String, dynamic> json) {
  return Ranking(
    id: json['id'] as String?,
    userId: json['user_id'] as String?,
    typeRank: json['type_rank'] as String?,
    name: json['name'] as String?,
    score: json['score'] as String?,
    categoryId: json['category_id'] as String?,
  );
}

Map<String, dynamic> _$RankingToJson(Ranking instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'type_rank': instance.typeRank,
      'name': instance.name,
      'score': instance.score,
    };
