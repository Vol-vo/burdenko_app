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
      body: SafeArea(child: Column(
        children: [
          _customAppbar(),
          SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          )
        ],
      ),
      )
    );
  }

  Widget _customAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_sharp),iconSize: 40),
        Text(
          _currentLogbook.title,
          style: const TextStyle(color: Colors.indigo, fontSize: 30, fontWeight: FontWeight.w900),
        ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.upload_file_sharp), iconSize: 40)
      ],
    );
  }
}
