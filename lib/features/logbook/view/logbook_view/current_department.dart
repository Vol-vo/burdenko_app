import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:burdenko/features/logbook/models/department.dart';

class CurrentDepartment extends StatefulWidget {
  const CurrentDepartment({super.key});

  @override
  _CurrentDepartmentState createState() => _CurrentDepartmentState();
}

class _CurrentDepartmentState extends State<CurrentDepartment> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log("Args is null");
      return;
    }
    if (args is! Department) {
      log("Arguments is not a Logbook");
    }
    _department = args as Department;
  }

  late Department _department;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCurrentDepartment(
        currentDepartment: _department,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height:
                MediaQuery.of(context).size.height * 0.1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/logbook",
                          arguments: _department.params);
                    },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      // Border
                      borderRadius:
                      BorderRadius.circular(18.0),
                    ),
                  ),
                    child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Первичный осмотр",
                            style: TextStyle(
                                fontSize: 40))),),
              ),
              SizedBox(
                height:
                MediaQuery.of(context).size.height * 0.1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/logbook",
                          arguments: _department.getCurrentParametersForLogbook());
                    },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      // Border
                      borderRadius:
                      BorderRadius.circular(18.0),
                    ),
                  ),
                    child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Ежедневный осмотр",
                            style: TextStyle(
                                fontSize: 40)))),
              )
            ],
          ),
        ),
      ),
    );
  }

}

class CustomAppBarCurrentDepartment extends StatelessWidget
    implements PreferredSizeWidget {
  CustomAppBarCurrentDepartment({super.key, required this.currentDepartment});

  late Department currentDepartment;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_sharp),
              iconSize: 40)
        ],
      ),
    );
  }
}
