
import 'package:json_annotation/json_annotation.dart';

part 'base_value_for_parameter.g.dart';

@JsonSerializable()
class BaseValueForParameter{
  BaseValueForParameter({required this.name, required this.value});
  final String name;
  final String value;

  factory BaseValueForParameter.fromJson(Map<String, dynamic> json) => _$BaseValueForParameterFromJson(json);

  Map<String, dynamic> toJson() => _$BaseValueForParameterToJson(this);

}