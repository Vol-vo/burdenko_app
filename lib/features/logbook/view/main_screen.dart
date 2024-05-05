import 'dart:async';

import 'package:flutter/material.dart';
import 'package:burdenko/features/logbook/models/data_for_view/button_on_main_page.dart';
import 'package:burdenko/features/logbook/repositories/repositories_button_on_main_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final repository = RepositoriesButtonOnMainPage();

  late final Completer<List<ButtonOnMainPage>> buttonList;

  @override
  void initState() {
    super.initState();
    buttonList = Completer();
    repository
        .getButtonOnMainPage('assets/json_data/button_on_main_screen.json')
        .then((value) {
      buttonList.complete(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Panel2.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                child: FutureBuilder(
                    future: buttonList.future,
                    builder: (context, state) {
                      if (!state.hasData) {
                        return const CircularProgressIndicator();
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
                                              context, e.navigator);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
