part of 'write_base_value_in_params_bloc.dart';

abstract class WriteBaseValueInParamsEvent {
  List<SelectableParameter> getParameters();
}

class WriteValueInParamsEvent extends WriteBaseValueInParamsEvent{
  WriteValueInParamsEvent(this.parameters);
  final List<SelectableParameter> parameters;

  @override
  List<SelectableParameter> getParameters(){
    return parameters;
  }

}
