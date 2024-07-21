import 'package:bloc/bloc.dart';
import 'package:burdenko/core/models/model_for_department/data_for_send_and_build_docx/data_for_send_and_build_docx.dart';
import 'package:burdenko/core/data/dto/dio.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/models/model_for_department/selectable_parameter/selectable_parameter.dart';

part 'send_and_loading_file_event.dart';

part 'send_and_loading_file_state.dart';

class SendAndLoadingFileBloc
    extends Bloc<SendAndLoadingFileEvent, SendAndLoadingFileState> {
  SendAndLoadingFileBloc() : super(DefaultState()) {
    on<SendAndLoadingFileEvent>(_onSendData);
  }

  _onSendData(event, emit) async {
    DataForSendAndBuildDocx data = event.getDataForSendAndBuildDocx();
    if (kIsWeb) {

    } else {
      final response = await dio.post("client/data",
          data: data.toJson(),
          options: Options(responseType: ResponseType.bytes));
      await _saveDocxOnMemory(
          response.data, _getNameForFile(data.department.params));
      emit(FileIsReadyState());
    }
    emit(SendDataState());
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
}
