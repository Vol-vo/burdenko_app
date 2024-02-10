import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:burdenko/features/logbook/data/export_dnevnicki_general.dart';

class Dnevnichki extends StatefulWidget {
  const Dnevnichki({Key? key}) : super(key: key);
  @override
  DnevnichkiState createState() => DnevnichkiState();
}

class DnevnichkiState extends State<Dnevnichki> {


  late Logbook dnevnichkiGeneral;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log("Args is null");
      return;
    }
    if (args is! Logbook) {
      log("Arguments is not DnevnickiGeneral");
    }
    dnevnichkiGeneral = args as Logbook;
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
