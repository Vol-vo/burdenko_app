import 'package:burdenko/features/logbook/models/selectable_parameter.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:burdenko/features/logbook/view/widgets/params_view.dart';

class InitialInspection extends StatefulWidget {
  const InitialInspection({super.key});

  @override
  State<InitialInspection> createState() => _InitialInspectionState();
}

class _InitialInspectionState extends State<InitialInspection> {
  late List<SelectableParameter> _params;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log("Args is null");
      return;
    }
    if (args is! List<SelectableParameter>) {
      log("Arguments is not a List<SelectableParameter>");
    }
    _params = args as List<SelectableParameter>;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
            child: Column(
            children: [
              for (var widget in _params)
                Params(parameter: widget)
            ],
          ),
        ));
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const CustomAppBar({super.key});

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
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.upload_file_sharp),
            iconSize: 40)
      ],
    ));
  }
}
