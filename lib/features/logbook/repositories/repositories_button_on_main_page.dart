import 'dart:convert';

import 'package:burdenko/features/logbook/data/button_on_main_page.dart';
import 'package:flutter/services.dart';


class RepositoriesButtonOnMainPage{
  Map<String, dynamic> getJsonMap(String file){
    String jsonString = rootBundle.loadString(file) as String;
    return jsonDecode(jsonString);
  }

  List<ButtonOnMainPage> getButtonOnMainPage(String file) {
    Map<String, dynamic> jsonMap = getJsonMap(file);
    final result = jsonMap.entries.map((e) => ButtonOnMainPage.fromJson(jsonMap)).toList();
    return result;
  }
}