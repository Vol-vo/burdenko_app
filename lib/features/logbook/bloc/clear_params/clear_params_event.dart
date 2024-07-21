part of 'clear_params_bloc.dart';

@immutable
sealed class ClearParamsEvent {
}
class ClearEvent extends ClearParamsEvent{
  ClearEvent({required this.params});
  List<SelectableParameter> params;
}