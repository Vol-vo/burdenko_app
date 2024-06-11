import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:burdenko/features/logbook/models/data_for_view/data_for_send_and_build_docx.dart';
import 'package:burdenko/features/logbook/models/data_for_view/selectable_parameter.dart';
import 'package:burdenko/features/logbook/repositories/dio.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

part 'send_and_loading_file_event.dart';

part 'send_and_loading_file_state.dart';

class SendAndLoadingFileBloc
    extends Bloc<SendAndLoadingFileEvent, SendAndLoadingFileState> {
  SendAndLoadingFileBloc() : super(DefaultState()) {
    on<SendAndLoadingFileEvent>(_onSendData);
  }

  _onSendData(event, emit) async {
    DataForSendAndBuildDocx data = event.getDataForSendAndBuildDocx();
    emit(SendDataState());
    if (kIsWeb) {

    } else {
      final response = await dio.post("client/data",
          data: _getStringJson(data),
          options: Options(responseType: ResponseType.bytes));
      await _saveDocxOnMemory(
          response.data, _getNameForFile(data.department.params));
      emit(FileIsReadyState());
    }
  }


  Future<void> _saveDocxOnMemory(Uint8List content, String nameFile) async {
    await FilePicker.platform.saveFile(
      dialogTitle: 'Пожалуйста, назовите ваш файл: ',
      fileName: '$nameFile.doc',
      bytes: content,
    );
  }

  String _getNameForFile(List<SelectableParameter> params) {
    for (var param in params) {
      if (param.title == "ФИО: ") {
        return param.getValue();
      }
    }
    return "Без названия";
  }

  String _getStringJson(DataForSendAndBuildDocx data) {
    Map<String, dynamic> mainMap = {};
    mainMap["direction"] = data.department.title;
    mainMap["examinationType"] = _getExaminationType(data.isLogbook);
    mainMap["ExaminationData"] = _getParamsJson(data.department.params);
    return jsonEncode(mainMap);
  }

  Map<String, dynamic> _getParamsJson(List<SelectableParameter> arrayParams) {
    Map<String, dynamic> mainMap = {};
    for (int i = 0; i < arrayParams.length; i++) {
      mainMap[arrayParams[i].title] = arrayParams[i].getValue();
    }
    return mainMap;
  }

  String _getExaminationType(bool boolean) {
    if (boolean) {
      return "DAILY";
    }
    return "INITIAL";
  }
}
