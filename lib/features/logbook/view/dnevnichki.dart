import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:burdenko/features/logbook/data/export_dnevnicki_general.dart';

class Dnevnichki extends StatefulWidget {
  const Dnevnichki({super.key});
  @override
  DnevnichkiState createState() => DnevnichkiState();
}

class DnevnichkiState extends State<Dnevnichki> {


  late Department dnevnichkiGeneral;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log("Args is null");
      return;
    }
    if (args is! Department) {
      log("Arguments is not DnevnickiGeneral");
    }
    dnevnichkiGeneral = args as Department;
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
