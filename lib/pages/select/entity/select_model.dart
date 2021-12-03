import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'select_model.g.dart';

@CopyWith()
@JsonSerializable()
class SelectModel {
  SelectModel({this.listCategory = const [], this.accessToken, this.draftToken});

  @JsonKey(name: "access_token")
  final String? accessToken;
  @JsonKey(name: "draft_token")
  final String? draftToken;
  @JsonKey(name: "listCategory")
  final List<Category>? listCategory;

  factory SelectModel.fromJson(Map<String, dynamic> json) =>
      _$SelectModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectModelToJson(this);
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

  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "created")
  final String? created;
  @JsonKey(name: "modified")
  final String? modified;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}