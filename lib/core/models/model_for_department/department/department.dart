import 'package:json_annotation/json_annotation.dart';

import '../selectable_parameter/selectable_parameter.dart';

part 'department.g.dart';

@JsonSerializable()
class Department{  //
  List<SelectableParameter> params;
  late String title;
  late String navigator;

  Department({
    required this.title,
    required this.navigator,
    required this.params
  });

  Department getCurrentDepartmentForLogbook(){
    List<SelectableParameter> currentParameters = [];
    for(var par in params){
      if (par.inLogbook) {
        currentParameters.add(par);
      }
    }
    Department dep = Department(params: params, title: title, navigator: navigator);
    dep.params = currentParameters;
    return dep;
  }

  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);

}