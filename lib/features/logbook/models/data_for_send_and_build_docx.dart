import 'package:burdenko/features/logbook/data/export_dnevnicki_general.dart';

class DataForSendAndBuildDocx{
  DataForSendAndBuildDocx({required this.department, required this.isLogbook});
  late final Department department;
  late final bool isLogbook;
}