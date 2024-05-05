import 'package:burdenko/features/logbook/models/data_for_view/department.dart';
import 'package:flutter/material.dart';

class DnevnickiListScreen extends StatelessWidget {
  DnevnickiListScreen({super.key});

  final List<Department> dnevnickiList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ListView.separated(
          separatorBuilder: (context, i) => const Divider(),
          itemCount: dnevnickiList.length,
          itemBuilder: (context, i) => ListTile(
            title: Text(dnevnickiList[i].title),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () => Navigator.pushNamed(context, "/dnevnicki_general",
                arguments: dnevnickiList[i]
            ),
          ),
        )
    );
  }
}
