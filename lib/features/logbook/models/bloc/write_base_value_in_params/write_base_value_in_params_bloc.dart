
import 'package:bloc/bloc.dart';

part 'write_base_value_in_params_event.dart';
part 'write_base_value_in_params_state.dart';

class WriteBaseValueInParamsBloc extends Bloc<WriteBaseValueInParamsEvent, WriteBaseValueInParamsState> {
  WriteBaseValueInParamsBloc() : super(WriteBaseValueInParamsInitial()) {
    on<WriteBaseValueInParamsEvent>((event, emit) {
    });
  }
}
