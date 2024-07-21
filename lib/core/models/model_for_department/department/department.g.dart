// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      title: json['title'] as String,
      navigator: json['navigator'] as String,
      params: (json['params'] as List<dynamic>)
          .map((e) => SelectableParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'params': instance.params,
      'title': instance.title,
      'navigator': instance.navigator,
    };
