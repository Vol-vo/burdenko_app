import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:burdenko/features/logbook/models/data_for_view/data_for_send_and_build_docx.dart';
import 'package:burdenko/features/logbook/models/data_for_view/selectable_parameter.dart';
import 'package:burdenko/features/logbook/repositories/dio.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

part 'send_and_loading_file_event.dart';
part 'send_and_loading_file_state.dart';

class SendAndLoadingFileBloc extends Bloc<SendAndLoadingFileEvent, SendAndLoadingFileState> {
  SendAndLoadingFileBloc() : super(DefaultState()) {
    on<SendAndLoadingFileEvent>(_onSendData);
  }

  _onSendData(event, emit) async {
    DataForSendAndBuildDocx data = event.getDataForSendAndBuildDocx();
    emit(SendDataState());
    final response = await dio.post("client/data", data: _getStringJson(data));
    File file = await _saveDocxOnMemory(response.data, _getNameForFile(data.department.params));
    emit(FileIsReadyState(file: file));
  }

  Future<File> _saveDocxOnMemory(String content, String nameFile) async{
    final directory = await path_provider.getApplicationDocumentsDirectory();
    final path = "${directory.path}/$nameFile.docx";
    final file = File(path);
    file.create();
    file.writeAsString(content);
    log(file.existsSync().toString());
    return file;
  }

  String _getNameForFile(List<SelectableParameter> params){
    for(var param in params){
      if(param.title == "ФИО: "){
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
    for (int i = 0; i < arrayParams.length; i++){
      mainMap[arrayParams[i].title] = arrayParams[i].getValue();
    }
    return mainMap;
  }

  String _getExaminationType(bool boolean){
    if (boolean) {
      return "DAILY";
    }
    return "INITIAL";
    }
}
