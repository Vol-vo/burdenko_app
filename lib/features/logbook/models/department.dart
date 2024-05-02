import 'package:burdenko/features/logbook/models/selectable_parameter.dart';
class Department{  //
  List<SelectableParameter> params;
  late String title;
  late String image;
  late String navigator;

  Department({
    required this.title,
    required this.navigator,
    required this.image,
    required this.params
  });

  Department getCurrentDepartmentForLogbook(){
    List<SelectableParameter> currentParameters = [];
    for(var par in params){
      if (par.inLogbook) {
        currentParameters.add(par);
      }
    }
    Department dep = Department(params: params, title: title, image: image, navigator: navigator);
    dep.params = currentParameters;
    return dep;
  }

}