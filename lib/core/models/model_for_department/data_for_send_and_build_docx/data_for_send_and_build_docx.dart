import 'package:json_annotation/json_annotation.dart';

import '../department/department.dart';

part 'data_for_send_and_build_docx.g.dart';

@JsonSerializable()
class DataForSendAndBuildDocx{
  DataForSendAndBuildDocx({required this.department, required this.isLogbook});
  late final Department department;
  late final bool isLogbook;

  bool isReadyForSendAndBuildDocx(){
    for (var param in department.params) {
      if (param.required && param.getValue().isEmpty) {
        return false;
      }
    }
    return true;
  }

  factory DataForSendAndBuildDocx.fromJson(Map<String, dynamic> json) => _$DataForSendAndBuildDocxFromJson(json);

  Map<String, dynamic> toJson() => _$DataForSendAndBuildDocxToJson(this);

}