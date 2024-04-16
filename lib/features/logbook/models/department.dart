import 'package:burdenko/features/logbook/models/selectable_parameter.dart';
class Department{  //
  final List<SelectableParameter> params;
  late String title;
  late String image;
  late String navigator;

  Department({
    required this.title,
    required this.navigator,
    required this.image,
    required this.params
  });

  List<SelectableParameter> getCurrentParametersForLogbook(){
    List<SelectableParameter> currentParameters = [];
    for(var par in params){
      if (par.inLogbook) {
        currentParameters.add(par);
      }
    }
    return currentParameters;
  }

}