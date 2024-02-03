import 'dart:io';

import 'package:burdenko/features/dnevnik/data/dnevnik_repository.dart';
import 'package:flutter/material.dart';
import '../../router/main.dart';
import '../view/widgets/file_picker_screen.dart';
import 'dnevnik_repository_impl.dart';

Future<FileSystemEntity?> _picker(files) async {
  return await rootKey.currentState?.push<FileSystemEntity>(
    MaterialPageRoute<FileSystemEntity>(
      fullscreenDialog: true,
      builder: (BuildContext context) {
        return FilePickerPage(files: files);
      },
    ),
  );
}

DnevnikRepository dnevnikFactory() {
  return FileDnevnikRepositoryImpl(_picker);
}
