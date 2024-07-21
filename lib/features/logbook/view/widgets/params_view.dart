import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/calculators/command_for_params.dart';
import '../../../../core/models/model_for_department/department/department.dart';
import '../../../../core/models/model_for_department/selectable_parameter/selectable_parameter.dart';
import '../../bloc/clear_params/clear_params_bloc.dart';
import '../../bloc/write_base_value_in_params/write_base_value_in_params_bloc.dart';

class Params extends StatefulWidget {
  const Params({super.key, required this.parameter, required this.department});

  final SelectableParameter parameter;
  final Department department;

  @override
  State<Params> createState() => _Params();
}

class _Params extends State<Params> {
  @override
  void initState() {
    super.initState();
    parameter = widget.parameter;
    department = widget.department;
    controller.text = parameter.getValue();
  }

  late SelectableParameter parameter;
  late Department department;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WriteBaseValueInParamsBloc, WriteBaseValueInParamsState>(
          listener: (context, state) {
            setState(() {
              controller.text = parameter.getValue();
            });
          },
        ),
        BlocListener<ClearParamsBloc, ClearParamsState>(listener: (context, state){
          setState(() {
            controller.text = parameter.getValue();
          });
        })
      ],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller,
                    onChanged: (text) {
                      controller.text = text;
                      parameter.setValue(text);
                    },
                    decoration: InputDecoration(
                      labelText: parameter.title,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: Wrap(
                              children: [
                                for (var hint in parameter.hints)
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red),
                                          borderRadius: const BorderRadius.all(Radius.circular(20))
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          parameter.addValue(command(hint.value));
                                          setState(() {
                                            controller.text = parameter.getValue();
                                          });
                                        },
                                        child: Text(hint.name,
                                            style: const TextStyle(fontSize: 20)),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.add),
                constraints: const BoxConstraints(maxHeight: 40),
                iconSize: 30,
              )
            ],
          ),
        ],
      ),
    );
  }

  String command(String command) {
    if (command.contains("\$")) {
      return CommandForParams().getValueFromCommand(command, department);
    } else {
      return command;
    }
  }
}
