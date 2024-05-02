import 'package:burdenko/features/logbook/data/export_dnevnicki_general.dart';
import 'package:burdenko/features/logbook/models/selectable_parameter.dart';
import 'package:flutter/material.dart';
import 'package:burdenko/features/logbook/data/command_for_params.dart';

class Params extends StatefulWidget {
  Params({super.key, required this.parameter, required this.department});

  late SelectableParameter parameter;
  late Department department;

  @override
  State<Params> createState() => _Params();
}

class _Params extends State<Params> {
  @override
  void initState() {
    super.initState();
    parameter = widget.parameter;
    department = widget.department;
  }


  late SelectableParameter parameter;
  late Department department;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller,
                  onFieldSubmitted: (text){
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
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    content:  Wrap(
                      children: [
                        for (var hint in parameter.hints)
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextButton(
                              onPressed: () {
                                parameter.addValue(command(hint.value));
                                setState(() {
                                  controller.text = parameter.getValue();
                                });

                              },
                              child: Text(hint.name,
                                  style:
                                  const TextStyle(fontSize: 20)),
                            ),
                          )
                      ],
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
    );
  }
  String command(String command){
    if(command.contains("\$")){
      return CommandForParams().getValueFromCommand(command, department);
    }else{
      return command;
    }
  }
}
