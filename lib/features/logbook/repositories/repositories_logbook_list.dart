import 'dart:convert';
import 'package:burdenko/features/logbook/models/data_for_view/department.dart';
import 'package:burdenko/features/logbook/models/data_for_view/hints.dart';
import 'package:burdenko/features/logbook/models/data_for_view/selectable_parameter.dart';
import 'package:flutter/services.dart';
import 'package:burdenko/features/logbook/models/data_for_view/base_value_for_parameter.dart';

class RepositoriesLogBookList {
  Future<List<Department>> getLogbookList(String fileString) async {
    final List<dynamic> listJson =
        jsonDecode(await rootBundle.loadString(fileString));
    List<Department> logbookList = [];
    for (int i = 0; i < listJson.length; i++) {
      logbookList.add(Department(
        title: listJson[i]["title"],
        navigator: listJson[i]["navigator"],
        image: listJson[i]["image"],
        params: await _getSelectableParameterList(listJson[i]["params"]),

      ));
    }
    return logbookList;
  }

  Future<List<SelectableParameter>> _getSelectableParameterList(List<dynamic> params) async {
    List<SelectableParameter> selectableParameterList = [];
    for (int i = 0; i < params.length; i++){
      selectableParameterList.add(SelectableParameter(
          title: params[i]["title"],
          hints: await _getHintsList(params[i]["hints"] as List<dynamic>),
          required: params[i]["required"],
          isOneValue: params[i]["isOneValue"],
          inLogbook: params[i]["inLogbook"],
          baseValues: await _getBaseValueForParameter(params[i]["baseValue"] as List<dynamic>)
      ));
    }
    return selectableParameterList;
  }

  Future<List<Hints>> _getHintsList(List<dynamic> params) async{
    List<Hints> hintsList = [];
    for (int i = 0; i < params.length; i++){
      hintsList.add(Hints(name: params[i]["name"], value: params[i]["value"]));
    }
    return hintsList;
  }

  Future<List<BaseValueForParameter>> _getBaseValueForParameter(List<dynamic> baseValues) async {
    List<BaseValueForParameter> baseValueForParameterList = [];
    for (int i = 0; i < baseValues.length; i++){
      baseValueForParameterList.add(BaseValueForParameter(
        name: baseValues[i]["name"],
        value: baseValues[i]["value"]
      ));
    }
    return baseValueForParameterList;
  }
}
