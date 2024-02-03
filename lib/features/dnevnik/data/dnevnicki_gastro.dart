import 'package:flutter/material.dart';
import 'package:burdenko/features/dnevnik/data/dnevnicki_general.dart';
import 'package:burdenko/features/dnevnik/models/selectable_parameter.dart';

class DnevnickiGastro extends DnevnichkiGeneral{

  @override
  List<SelectableParameter> get params => [
    SelectableParameter(
      title: 'Температура',
      hints: [
        '36.6',
        '37.0',
        '38.0',
      ],
    ),
    SelectableParameter(
      title: 'Время',
      hints: [
        '10:00',
        '11:00',
        '12:00',
        '10:00',
        '11:00',
        '12:00',
      ],
    ),
    SelectableParameter(
      title: 'Температура2',
      hints: [
        '36.6',
        '37.0',
        '38.0',
      ],
    ),
  ];

  @override
  String get title => "Гастро: дневник";
  @override
  get image => Image.asset("assets/images/Panel2.jpg");
}