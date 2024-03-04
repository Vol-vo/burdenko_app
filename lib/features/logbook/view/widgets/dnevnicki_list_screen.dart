import 'package:flutter/material.dart';
import 'package:burdenko/features/logbook/data/export_dnevnicki_general.dart';

class DnevnickiListScreen extends StatelessWidget {
  DnevnickiListScreen({super.key});

  final List<Logbook> dnevnickiList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ListView.separated(
          separatorBuilder: (context, i) => const Divider(),
          itemCount: dnevnickiList.length,
          itemBuilder: (context, i) => ListTile(
            leading: dnevnickiList[i].image,
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
