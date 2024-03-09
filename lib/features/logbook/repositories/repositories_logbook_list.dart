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
        params: List<SelectableParameter>.from(listJson[i]["params"])
      ));
    }
    return logbookList;
  }
}
