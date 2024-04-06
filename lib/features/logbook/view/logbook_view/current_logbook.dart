import 'package:burdenko/features/logbook/data/export_dnevnicki_general.dart';
import 'package:burdenko/features/logbook/models/selectable_parameter.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:burdenko/features/logbook/data/logbook.dart';

class CurrentLogbook extends StatefulWidget {
  const CurrentLogbook({super.key});

  @override
  State<CurrentLogbook> createState() => _CurrentLogbookState();
}

class _CurrentLogbookState extends State<CurrentLogbook> {
  late Logbook _currentLogbook;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log("Args is null");
      return;
    }
    if (args is! Logbook) {
      log("Arguments is not a Logbook");
    }
    _currentLogbook = args as Logbook;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(currentLogbook: _currentLogbook),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: Column(
            children: [
              for (var widget in _currentLogbook.params)
                Params(parameter: widget)
            ],
          ),
        )));
  }
}

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
    TextEditingController controller = TextEditingController();
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                controller: controller,
                  onChanged: (newValue) {
                    setState(() {
                      parameter.setValue(newValue);
                    });
                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: parameter.title,
                  )),
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
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.lightBlueAccent)),
                              onPressed: () {
                                parameter.setValue(hint);
                                controller.text = parameter.getValue();
                                setState(() {
                                  controller.text = parameter.getValue();
                                });
                                print(parameter.getValue());
                                },
                              child: Text(hint,
                                  style:
                                  const TextStyle(fontSize: 20, color: Colors.black)),
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  late Logbook currentLogbook;

  CustomAppBar({super.key, required this.currentLogbook});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
            iconSize: 40),
        Text(
          currentLogbook.title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.upload_file_sharp),
            iconSize: 40)
      ],
    ));
  }
}
