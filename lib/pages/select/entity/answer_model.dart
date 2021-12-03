import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_model.g.dart';

@CopyWith()
@JsonSerializable()
class AnswerModel {
  AnswerModel({this.listAnswerUser = const [], this.status,});

  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "listAnswerUser")
  final List<Answer>? listAnswerUser;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}

@CopyWith()
@JsonSerializable()
class Answer {
  Answer({
    this.id,
    this.userId,
    this.questionId,
    this.answer,
    this.categoryId,
  });

  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "user_id")
  final String? userId;
  @JsonKey(name: "category_id")
  final String? categoryId;
  @JsonKey(name: "question_id")
  final String? questionId;
  @JsonKey(name: "answer")
  final String? answer;



  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
