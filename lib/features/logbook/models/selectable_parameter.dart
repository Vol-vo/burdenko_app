import 'package:burdenko/features/logbook/models/hints.dart';

class SelectableParameter {
  SelectableParameter({
    required this.title,
    required this.hints,
    required this.required,
    required this.isOneValue,
    required this.inLogbook
  });

  final String title;
  final List<Hints> hints;
  final bool required;
  final bool isOneValue;
  final bool inLogbook;
  String _value = "";

  /*
  TODO: Изменить setValue на addValue и добавить setValue
   */

  void setValue(String newValue) {
    if (!isOneValue && _value.isNotEmpty) {
      _value += ", $newValue";
      return;
    }
    _value = newValue;
  }

  String getValue() {
    return _value;
  }



}
