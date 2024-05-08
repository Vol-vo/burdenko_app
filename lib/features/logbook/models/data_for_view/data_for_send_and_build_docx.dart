import 'package:burdenko/features/logbook/models/data_for_view/department.dart';

class DataForSendAndBuildDocx{
  DataForSendAndBuildDocx({required this.department, required this.isLogbook});
  late final Department department;
  late final bool isLogbook;

  bool isReadyForSendAndBuildDocx(){
    for (var param in department.params) {
      if (param.required && param.getValue().isEmpty) {
        return false;
      }
    }
    return true;
  }

}