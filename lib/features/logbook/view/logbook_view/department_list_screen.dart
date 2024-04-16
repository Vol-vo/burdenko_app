import 'package:flutter/material.dart';
import 'dart:async';
import 'package:burdenko/features/logbook/models/department.dart';
import 'package:burdenko/features/logbook/repositories/repositories_logbook_list.dart';

class DepartmentListScreen extends StatefulWidget {
  const DepartmentListScreen({super.key});

  @override
  State<DepartmentListScreen> createState() => _DepartmentListScreenState();
}

class _DepartmentListScreenState extends State<DepartmentListScreen> {
  final repository = RepositoriesLogBookList();

  late final Completer<List<Department>> logbookList;

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
        title: const Text("Отделения", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700)),
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
  const Button({super.key, required Department e}) : _logbook = e;
  final Department _logbook;
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
