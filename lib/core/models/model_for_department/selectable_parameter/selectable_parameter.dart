import 'package:burdenko/core/models/model_for_department/base_value_for_parameter/base_value_for_parameter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../hints/hints.dart';

part 'selectable_parameter.g.dart';

@JsonSerializable()
class SelectableParameter {
  SelectableParameter({
    required this.title,
    required this.hints,
    required this.required,
    required this.isOneValue,
    required this.inLogbook,
    this.baseValues
  });

  final String title;
  List<Hints> hints;
  final bool required;
  final bool isOneValue;
  final bool inLogbook;
  String _value = "";
  @JsonKey(name: "baseValue")
  List<BaseValueForParameter>? baseValues;


  void addValue(String newValue) {
    if (!isOneValue && _value.isNotEmpty) {
      _value += ", $newValue";
      return;
    }
    _value = newValue;
  }

  void setValue(String newValue){
    _value = newValue;
  }

  String getValue() {
    return _value;
  }

  void clearValue(){
    _value = "";
  }

  factory SelectableParameter.fromJson(Map<String, dynamic> json) => _$SelectableParameterFromJson(json);

  Map<String, dynamic> toJson() => _$SelectableParameterToJson(this);
}
