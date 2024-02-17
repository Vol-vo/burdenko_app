import 'dart:convert';

import 'package:burdenko/features/logbook/data/button_on_main_page.dart';
import 'package:flutter/services.dart';


class RepositoriesButtonOnMainPage{
  Future<Map<String, dynamic>> getJsonMap(String file) async {
    String jsonString = await rootBundle.loadString(file);
    return jsonDecode(jsonString);
  }

  Future<List<ButtonOnMainPage>> getButtonOnMainPage(String file) async {
    Map<String, dynamic> jsonMap = await getJsonMap(file);
    final result = jsonMap.entries.map((e) => ButtonOnMainPage.fromJson(jsonMap)).toList();
    return result;
  }
}