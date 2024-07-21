import 'package:bloc/bloc.dart';

import '../../../../../core/models/model_for_department/selectable_parameter/selectable_parameter.dart';

part 'write_base_value_in_params_event.dart';
part 'write_base_value_in_params_state.dart';

class WriteBaseValueInParamsBloc extends Bloc<WriteBaseValueInParamsEvent, WriteBaseValueInParamsState> {
  WriteBaseValueInParamsBloc() : super(DefaultState()) {
    on<WriteBaseValueInParamsEvent>(_writeBaseValue);
  }

  _writeBaseValue(event, emit) {
    List<SelectableParameter> params = event.getParameters();
    for (SelectableParameter param in params){
      if (param.baseValues != null){
        for(var baseValue in param.baseValues!){
          if (baseValue.name == "base"){
            param.setValue(baseValue.value);
          }
        }
      }
    }
    emit(ReworkState());
  }

}
