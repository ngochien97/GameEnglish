import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details_model.g.dart';

@CopyWith()
@JsonSerializable()
class DetailsModel {
  DetailsModel({this.listQuestion, this.accessToken, this.draftToken});

  @JsonKey(name: "access_token")
  final String? accessToken;
  @JsonKey(name: "draft_token")
  final String? draftToken;
  @JsonKey(name: "listQuestion")
  final List<Question>? listQuestion;

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsModelToJson(this);
}

@CopyWith()
@JsonSerializable()
class Question {
  Question({
    this.id,
    this.question,
    this.answerOne,
    this.answerTwo,
    this.trueAnswer,
    this.categoryId,
    this.created,
    this.modified,
    this.category,
  });

  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "answer_one")
  final String? answerOne;
  @JsonKey(name: "answer_two")
  final String? answerTwo;
  @JsonKey(name: "true_answer")
  final String? trueAnswer;
  @JsonKey(name: "category_id")
  final String? categoryId;
  @JsonKey(name: "created")
  final String? created;
  @JsonKey(name: "modified")
  final String? modified;
  final List<Category>? category;


  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@CopyWith()
@JsonSerializable()
class Category {
  Category({
    this.id,
    this.name,
    this.created,
    this.modified,
  });

  String? id;
  String? name;
  String? created;
  String? modified;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}