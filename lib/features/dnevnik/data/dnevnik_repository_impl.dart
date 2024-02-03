import 'dart:convert';
import 'dart:io';

import 'package:burdenko/features/dnevnik/data/dnevnik_repository.dart';
import 'package:burdenko/features/dnevnik/models/parameter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class FileDnevnikRepositoryImpl extends DnevnikRepository {
  FileDnevnikRepositoryImpl(this.filePicker);

  Future<FileSystemEntity?> Function(List<FileSystemEntity> files) filePicker;

  @override
  Future<List<Parameter>> load() async {
    final initPath = (await getApplicationDocumentsDirectory()).path;

    final files = Directory(initPath)
        .listSync()
        .where((element) => element.path.endsWith('.json'))
        .toList();

    final result = await filePicker(files);

    if (result != null) {
      File file = File(result.path);
      final stringData = await file.readAsString();
      final data = jsonDecode(stringData) as Map<String, dynamic>;
      return data.entries
          .map((e) => Parameter(title: e.key, value: e.value))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> save(List<Parameter> parameters) async {
    final resultString = jsonEncode(
        Map.fromEntries(parameters.map((e) => MapEntry(e.title, e.value))));
    final dir = await getApplicationDocumentsDirectory();
    var path = '${dir.path}/${DateTime.now().toString()}.json';
    var file = File(path);
    await file.writeAsString(resultString);
    await Share.shareXFiles([XFile(path)]);
  }
}
