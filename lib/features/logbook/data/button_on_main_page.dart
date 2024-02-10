import 'package:json_annotation/json_annotation.dart';

part 'button_on_main_page.g.dart';

@JsonSerializable()
class ButtonOnMainPage{
  late String title;
  late String navigator;

  ButtonOnMainPage({
    required this.title,
    required this.navigator
  });

  factory ButtonOnMainPage.fromJson(Map<String, dynamic> json) => _$ButtonOnMainPageFromJson(json);
  Map<String, dynamic> toJson() => _$ButtonOnMainPageToJson(this);

}