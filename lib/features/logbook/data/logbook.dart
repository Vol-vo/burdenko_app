import 'package:burdenko/features/logbook/models/selectable_parameter.dart';
class Logbook{  //
  final List<SelectableParameter> params;
  late String title;
  late String image;
  late String navigator;

  Logbook({
    required this.title,
    required this.navigator,
    required this.image,
    required this.params
  });
}