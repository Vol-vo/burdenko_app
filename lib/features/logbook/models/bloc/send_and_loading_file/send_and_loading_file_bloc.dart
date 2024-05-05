import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:burdenko/features/logbook/models/data_for_view/data_for_send_and_build_docx.dart';
import 'package:burdenko/features/logbook/models/data_for_view/selectable_parameter.dart';
import 'package:burdenko/features/logbook/models/dio.dart';
import "package:meta/meta.dart";

part 'send_and_loading_file_event.dart';
part 'send_and_loading_file_state.dart';

class SendAndLoadingFileBloc extends Bloc<SendAndLoadingFileEvent, SendAndLoadingFileState> {
  SendAndLoadingFileBloc() : super(DefaultState()) {
    on<SendAndLoadingFileEvent>(_onSendData);
  }

  _onSendData(event, emit) async {
    DataForSendAndBuildDocx data = event.getDataForSendAndBuildDocx();
    emit(SendDataState());
    final response = await dio.post("path", data: _getStringJson(data));
  }

  String _getStringJson(DataForSendAndBuildDocx data) {
    Map<String, dynamic> mainMap = {};
    mainMap["direction"] = data.department.title;
    mainMap["examinationType"] = _getExaminationType(data.isLogbook);
    mainMap["examinationData"] = _getParamsJson(data.department.params);
    return jsonEncode(mainMap);
  }

  Map<String, dynamic> _getParamsJson(List<SelectableParameter> arrayParams) {
    Map<String, dynamic> mainMap = {};
    for (int i = 0; i < arrayParams.length; i++){
      mainMap[arrayParams[i].title] = arrayParams[i].getValue();
    }
    return mainMap;
  }

  String _getExaminationType(bool boolean){
    if (boolean) {
      return "DAILY";
    }
    return "FIRST";
    }
}
