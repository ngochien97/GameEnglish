// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension AnswerModelCopyWith on AnswerModel {
  AnswerModel copyWith({
    List<Answer>? listAnswerUser,
    int? status,
  }) {
    return AnswerModel(
      listAnswerUser: listAnswerUser ?? this.listAnswerUser,
      status: status ?? this.status,
    );
  }
}

extension AnswerCopyWith on Answer {
  Answer copyWith({
    String? answer,
    String? categoryId,
    String? id,
    String? questionId,
    String? userId,
  }) {
    return Answer(
      answer: answer ?? this.answer,
      categoryId: categoryId ?? this.categoryId,
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      userId: userId ?? this.userId,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return AnswerModel(
    listAnswerUser: (json['listAnswerUser'] as List<dynamic>?)
        ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as int?,
  );
}

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'listAnswerUser': instance.listAnswerUser,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    id: json['id'] as String?,
    userId: json['user_id'] as String?,
    questionId: json['question_id'] as String?,
    answer: json['answer'] as String?,
    categoryId: json['category_id'] as String?,
  );
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'question_id': instance.questionId,
      'answer': instance.answer,
    };
