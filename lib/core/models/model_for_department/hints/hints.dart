
import 'package:json_annotation/json_annotation.dart';

part 'hints.g.dart';

@JsonSerializable()
class Hints{

  Hints({required this.name, required this.value});

  String name;
  String value;


  factory Hints.fromJson(Map<String, dynamic> json) => _$HintsFromJson(json);

  Map<String, dynamic> toJson() => _$HintsToJson(this);

}