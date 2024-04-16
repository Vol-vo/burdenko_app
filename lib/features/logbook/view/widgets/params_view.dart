import 'package:burdenko/features/logbook/models/selectable_parameter.dart';
import 'package:flutter/material.dart';

class Params extends StatefulWidget {
  Params({super.key, required this.parameter});

  late SelectableParameter parameter;

  @override
  State<Params> createState() => _Params();
}

class _Params extends State<Params> {
  @override
  void initState() {
    super.initState();
    parameter = widget.parameter;
  }


  late SelectableParameter parameter;
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
                  decoration: const InputDecoration(
                      border: OutlineInputBorder()
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    content:  Wrap(  //TODO: вынести в отдельный класс
                      children: [
                        for (var hint in parameter.hints)
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextButton(
                              onPressed: () {
                                parameter.setValue(hint.value);  //TODO: setValue заменить на AddValue
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
}