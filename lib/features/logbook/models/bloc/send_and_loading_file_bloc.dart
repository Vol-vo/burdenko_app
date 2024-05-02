import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burdenko/features/logbook/models/data_for_send_and_build_docx.dart';
import 'package:meta/meta.dart';
import 'dart:developer';

part 'send_and_loading_file_event.dart';
part 'send_and_loading_file_state.dart';

class SendAndLoadingFileBloc extends Bloc<SendAndLoadingFileEvent, SendAndLoadingFileState> {
  SendAndLoadingFileBloc() : super(SendDataState()) {
    on<SendAndLoadingFileEvent>(_onSendData);
  }

  _onSendData(event, emit) async {
    emit(SendDataState());
    await Future.delayed(Duration(seconds: 2));
    emit(BuildingDocxState());
    log("SendDataState apply");
    await Future.delayed(Duration(seconds: 2));
    emit(LoadingDocxState());
    log("LoadingDocxState apply");
  }
}
