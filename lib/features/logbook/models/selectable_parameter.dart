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
  List<Hints> hints;
  final bool required;
  final bool isOneValue;
  final bool inLogbook;
  String _value = "";


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



}
