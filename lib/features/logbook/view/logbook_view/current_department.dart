import 'package:burdenko/features/logbook/models/data_for_view/data_for_send_and_build_docx.dart';
import 'package:burdenko/features/logbook/models/data_for_view/department.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class CurrentDepartment extends StatefulWidget {
  const CurrentDepartment({super.key});

  @override
  State<StatefulWidget> createState() => _CurrentDepartmentState();
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height:
                MediaQuery.of(context).size.height * 0.1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/logbook",
                          arguments: DataForSendAndBuildDocx(department: _department, isLogbook: false));
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height:
                MediaQuery.of(context).size.height * 0.1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/logbook",
                          arguments: DataForSendAndBuildDocx(
                              department: _department.getCurrentDepartmentForLogbook(),
                              isLogbook: true
                          )
                      );
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
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class CustomAppBarCurrentDepartment extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarCurrentDepartment({super.key, required this.currentDepartment});

  final Department currentDepartment;

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
