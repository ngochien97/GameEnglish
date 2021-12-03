// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension DetailsModelCopyWith on DetailsModel {
  DetailsModel copyWith({
    String? accessToken,
    String? draftToken,
    List<Question>? listQuestion,
  }) {
    return DetailsModel(
      accessToken: accessToken ?? this.accessToken,
      draftToken: draftToken ?? this.draftToken,
      listQuestion: listQuestion ?? this.listQuestion,
    );
  }
}

extension QuestionCopyWith on Question {
  Question copyWith({
    String? answerOne,
    String? answerTwo,
    List<Category>? category,
    String? categoryId,
    String? created,
    String? id,
    String? modified,
    String? question,
    String? trueAnswer,
  }) {
    return Question(
      answerOne: answerOne ?? this.answerOne,
      answerTwo: answerTwo ?? this.answerTwo,
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      created: created ?? this.created,
      id: id ?? this.id,
      modified: modified ?? this.modified,
      question: question ?? this.question,
      trueAnswer: trueAnswer ?? this.trueAnswer,
    );
  }
}

extension CategoryCopyWith on Category {
  Category copyWith({
    String? created,
    String? id,
    String? modified,
    String? name,
  }) {
    return Category(
      created: created ?? this.created,
      id: id ?? this.id,
      modified: modified ?? this.modified,
      name: name ?? this.name,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsModel _$DetailsModelFromJson(Map<String, dynamic> json) {
  return DetailsModel(
    listQuestion: (json['listQuestion'] as List<dynamic>?)
        ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
    accessToken: json['access_token'] as String?,
    draftToken: json['draft_token'] as String?,
  );
}

Map<String, dynamic> _$DetailsModelToJson(DetailsModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'draft_token': instance.draftToken,
      'listQuestion': instance.listQuestion,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    id: json['id'] as String?,
    question: json['question'] as String?,
    answerOne: json['answer_one'] as String?,
    answerTwo: json['answer_two'] as String?,
    trueAnswer: json['true_answer'] as String?,
    categoryId: json['category_id'] as String?,
    created: json['created'] as String?,
    modified: json['modified'] as String?,
    category: (json['category'] as List<dynamic>?)
        ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer_one': instance.answerOne,
      'answer_two': instance.answerTwo,
      'true_answer': instance.trueAnswer,
      'category_id': instance.categoryId,
      'created': instance.created,
      'modified': instance.modified,
      'category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as String?,
    name: json['name'] as String?,
    created: json['created'] as String?,
    modified: json['modified'] as String?,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created': instance.created,
      'modified': instance.modified,
    };
