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
                          .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width:
                          MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height *
                              0.1,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, e.navigator, arguments: e);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  // Border
                                  borderRadius:
                                  BorderRadius.circular(18.0),
                                ),
                              ),
                              child: Text(e.title,
                                  style:
                                  const TextStyle(fontSize: 40))),
                        ),
                      ))
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
