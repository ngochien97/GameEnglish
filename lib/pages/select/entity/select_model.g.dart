// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension SelectModelCopyWith on SelectModel {
  SelectModel copyWith({
    String? accessToken,
    String? draftToken,
    List<Category>? listCategory,
  }) {
    return SelectModel(
      accessToken: accessToken ?? this.accessToken,
      draftToken: draftToken ?? this.draftToken,
      listCategory: listCategory ?? this.listCategory,
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

SelectModel _$SelectModelFromJson(Map<String, dynamic> json) {
  return SelectModel(
    listCategory: (json['listCategory'] as List<dynamic>?)
        ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
    accessToken: json['access_token'] as String?,
    draftToken: json['draft_token'] as String?,
  );
}

Map<String, dynamic> _$SelectModelToJson(SelectModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'draft_token': instance.draftToken,
      'listCategory': instance.listCategory,
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
