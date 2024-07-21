// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selectable_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectableParameter _$SelectableParameterFromJson(Map<String, dynamic> json) =>
    SelectableParameter(
      title: json['title'] as String,
      hints: (json['hints'] as List<dynamic>)
          .map((e) => Hints.fromJson(e as Map<String, dynamic>))
          .toList(),
      required: json['required'] as bool,
      isOneValue: json['isOneValue'] as bool,
      inLogbook: json['inLogbook'] as bool,
      baseValues: (json['baseValue'] as List<dynamic>?)
          ?.map(
              (e) => BaseValueForParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SelectableParameterToJson(
        SelectableParameter instance) =>
    <String, dynamic>{
      'title': instance.title,
      'hints': instance.hints,
      'required': instance.required,
      'isOneValue': instance.isOneValue,
      'inLogbook': instance.inLogbook,
      'baseValue': instance.baseValues,
    };
