/*
  Этот класс нужен, чтобы брать json из assets
 */


import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/model_for_department/department/department.dart';
import 'repositories_logbook_list.dart';

class RepositoriesLogBookListLocalJson extends RepositoriesLogbookList{
  @override
  Future<List<Department>> getLogbookList(String fileString) async {
    final List<dynamic> listJson =
    jsonDecode(await rootBundle.loadString(fileString));
    List<Department> logbookList = [];
    for(var i in listJson){
      logbookList.add(Department.fromJson(i as Map<String, dynamic>));
    }
    return logbookList;
  }
}
