import 'dart:convert';
import 'package:burdenko/features/logbook/data/export_dnevnicki_general.dart';
import 'package:flutter/services.dart';
import 'package:burdenko/features/logbook/data/logbook.dart';
import 'package:burdenko/features/logbook/models/selectable_parameter.dart';

class RepositoriesLogBookList {
  Future<List<Logbook>> getLogbookList(String fileString) async {
    final List<dynamic> listJson =
        jsonDecode(await rootBundle.loadString(fileString));
    List<Logbook> logbookList = [];
    for (int i = 0; i < listJson.length; i++) {
      logbookList.add(Logbook(
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
          isOneValue: params[i]["isOneValue"]
      ));
    }
    return selectableParameterList;
  }

  Future<List<String>> _getHintsList(List<dynamic> params) async{
    List<String> hintsList = [];
    for (int i = 0; i < params.length; i++){
      hintsList.add(params[i].toString());
    }
    return hintsList;
  }
}
