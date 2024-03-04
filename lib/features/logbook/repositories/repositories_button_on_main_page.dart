import 'dart:convert';

import 'package:burdenko/features/logbook/data/button_on_main_page.dart';
import 'package:flutter/services.dart';


class RepositoriesButtonOnMainPage{


  Future<List<ButtonOnMainPage>> getButtonOnMainPage(String fileString) async {
    final List <dynamic> listJson = jsonDecode(await rootBundle.loadString(fileString));
    List <ButtonOnMainPage> buttonList = [];
    for (int i = 0; i < listJson.length; i++){
      buttonList.add(ButtonOnMainPage(title: listJson[i]["title"], navigator: listJson[i]["navigator"]));
    }
    return buttonList;
  }


}