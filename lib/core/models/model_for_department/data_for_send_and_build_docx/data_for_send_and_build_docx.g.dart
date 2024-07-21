// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_for_send_and_build_docx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataForSendAndBuildDocx _$DataForSendAndBuildDocxFromJson(
        Map<String, dynamic> json) =>
    DataForSendAndBuildDocx(
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      isLogbook: json['isLogbook'] as bool,
    );

Map<String, dynamic> _$DataForSendAndBuildDocxToJson(
        DataForSendAndBuildDocx instance) =>
    <String, dynamic>{
      'department': instance.department,
      'isLogbook': instance.isLogbook,
    };
