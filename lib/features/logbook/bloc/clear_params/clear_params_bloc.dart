import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/model_for_department/selectable_parameter/selectable_parameter.dart';

part 'clear_params_event.dart';
part 'clear_params_state.dart';

class ClearParamsBloc extends Bloc<ClearParamsEvent, ClearParamsState> {
  ClearParamsBloc() : super(ClearParamsInitial()) {
    on<ClearEvent>(_clear);
  }

  _clear(ClearEvent event, emit) {
    for (var param in event.params){
      param.clearValue();
    }
    emit(ClearIsAlreadyState());
  }
}
