import 'dart:io';
import 'package:path_provider/path_provider.dart' as pathProvider;

final directory = _initDirectory();
Future<Directory> _initDirectory() async{
  final path = await pathProvider.getApplicationDocumentsDirectory();
  final directory = Directory("${path.path}/");
  return directory;
}