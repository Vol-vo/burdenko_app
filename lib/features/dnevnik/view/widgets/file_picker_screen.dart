import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class FilePickerPage extends StatelessWidget {
  const FilePickerPage({super.key, required this.files});

  final List<FileSystemEntity> files;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите файл'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: files
              .map(
                (e) => Card(
                  child: ListTile(
                    title: Text(e.uri.pathSegments.last),
                    titleTextStyle: Theme.of(context).textTheme.titleMedium,
                    style: ListTileStyle.list,
                    onTap: () {
                      Navigator.of(context).pop(e);
                    },
                    trailing: IconButton(
                      onPressed: () {
                        Share.shareXFiles([XFile(e.path)]);
                      },
                      icon: const Icon(Icons.share),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(16, 4, 4, 2),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
