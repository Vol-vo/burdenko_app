import 'package:intl/intl.dart';

import '../model_for_department/department/department.dart';
class CommandForParams{
  String getValueFromCommand(String params, Department department){
    switch (params){
      case "\$getTime": return _getTime();
    }
    return " ";
  }

  String _getTime(){
    return DateFormat('hh:mm').format(DateTime.now()).toString();
  }

}