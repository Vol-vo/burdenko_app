import 'package:flutter/material.dart';
import 'package:burdenko/features/dnevnik/data/export_dnevnicki_general.dart';

class Dnevnichki extends StatefulWidget {
  const Dnevnichki({Key? key, required this.dnevnichkiGeneral}) : super(key: key);
  final DnevnichkiGeneral dnevnichkiGeneral;
  @override
  _DnevnichkiState createState() => _DnevnichkiState(dnevnichkiGeneral: dnevnichkiGeneral);
}

class _DnevnichkiState extends State<Dnevnichki> {

  _DnevnichkiState({required this.dnevnichkiGeneral});

  DnevnichkiGeneral dnevnichkiGeneral;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
