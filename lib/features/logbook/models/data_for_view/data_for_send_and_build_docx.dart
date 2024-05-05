import 'package:burdenko/features/logbook/models/data_for_view/department.dart';

class DataForSendAndBuildDocx{
  DataForSendAndBuildDocx({required this.department, required this.isLogbook});
  late final Department department;
  late final bool isLogbook;
}