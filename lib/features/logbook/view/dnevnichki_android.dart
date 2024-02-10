import 'package:burdenko/features/logbook/models/parameter.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../domain/dnevnik_manager.dart';
import '../models/selectable_parameter.dart';
import 'widgets/text_parameter_input.dart';

class DnevnichkiAndroid extends StatelessWidget {
  DnevnichkiAndroid({super.key});

  final List<SelectableParameter> params = [
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Гастро: дневник'),
        actions: [
          IconButton(
            onPressed: () {
              DnevnikManager.instance.save();
            },
            icon: const Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {
              DnevnikManager.instance.load();
            },
            icon: const Icon(Icons.file_upload),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ValueListenableBuilder<List<Parameter>>(
          valueListenable: DnevnikManager.instance.selectedParameter,
          builder: (context, value, _) {
            return ListView(
                children: params
                    .map((param) => TextParameterInput(
                          title: param.title,
                          hints: param.hints,
                          initValue: _getInitValue(value, param.title),
                          onSelect: (data) {
                            DnevnikManager.instance.selectParameter(
                              Parameter(
                                title: param.title,
                                value: data,
                              ),
                            );
                          },
                        ))
                    .toList());
          },
        ),
      ),
    );
  }

  String? _getInitValue(List<Parameter> value, String title) {
    return value.firstWhereOrNull((item) => item.title == title)?.value;
  }
}
