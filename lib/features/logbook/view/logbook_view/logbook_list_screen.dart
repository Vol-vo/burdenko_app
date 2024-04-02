import 'package:flutter/material.dart';
import 'dart:async';
import 'package:burdenko/features/logbook/data/logbook.dart';
import 'package:burdenko/features/logbook/repositories/repositories_logbook_list.dart';

class LogbookListScreen extends StatefulWidget {
  const LogbookListScreen({super.key});

  @override
  State<LogbookListScreen> createState() => _LogbookListScreenState();
}

class _LogbookListScreenState extends State<LogbookListScreen> {
  final repository = RepositoriesLogBookList();

  late final Completer<List<Logbook>> logbookList;

  @override
  void initState() {
    super.initState();
    logbookList = Completer();
    repository
        .getLogbookList('assets/json_data/logbook_list.json')
        .then((value) {
      logbookList.complete(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Дневники", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future: logbookList.future,
                  builder: (context, state) {
                    if (!state.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Column(
                      children: state.data!
                          .map((e) => Button(e: e))
                          .toList(),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}

class Button extends StatelessWidget{

  const Button({super.key, required Logbook e}) : _logbook = e;

  final Logbook _logbook;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width:
        MediaQuery.of(context).size.width * 0.9,
        height:
        MediaQuery.of(context).size.height * 0.1,
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, _logbook.navigator,
                  arguments: _logbook);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                // Border
                borderRadius:
                BorderRadius.circular(18.0),
              ),
            ),
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(_logbook.title,
                    style: const TextStyle(
                        fontSize: 40)))),
      ),
    );
  }
}
