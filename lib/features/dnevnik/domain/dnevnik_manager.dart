import 'package:burdenko/features/dnevnik/data/dnevnik_repository.dart';
import 'package:burdenko/features/dnevnik/data/dnevnik_repository_factory.dart';
import 'package:burdenko/features/dnevnik/models/parameter.dart';
import 'package:flutter/cupertino.dart';

class DnevnikManager {
  static DnevnikManager get instance => _instance;
  static final DnevnikManager _instance = DnevnikManager._();

  DnevnikManager._();

  DnevnikRepository repo = dnevnikFactory();

  final ValueNotifier<List<Parameter>> _selectedParameter = ValueNotifier([]);
  ValueNotifier<List<Parameter>> get selectedParameter => _selectedParameter;

  void selectParameter(Parameter parameter) {
    final List<Parameter> value = List.from(_selectedParameter.value);
    value.removeWhere((element) => element.title == parameter.title);
    if (parameter.value.isNotEmpty) {
      value.add(parameter);
    }
    _selectedParameter.value = value;
  }

  Future<void> save() async {
    await repo.save(_selectedParameter.value);
  }

  Future<void> load() async {
    _selectedParameter.value = await repo.load();
  }
}
