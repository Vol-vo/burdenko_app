import 'package:burdenko/features/logbook/models/data_for_send_and_build_docx.dart';
import 'package:flutter/material.dart';
import 'package:burdenko/features/logbook/models/bloc/send_and_loading_file_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class DepartureParamsAndSendingOnEmail extends StatefulWidget {
  const DepartureParamsAndSendingOnEmail({super.key});

  @override
  State<StatefulWidget> createState() =>
      _DepartureParamsAndSendingOnEmailState();
}

class _DepartureParamsAndSendingOnEmailState
    extends State<DepartureParamsAndSendingOnEmail> {

  late DataForSendAndBuildDocx _dataForSendAndBuildDocx;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log("Args is null");
      return;
    }
    if (args is! DataForSendAndBuildDocx) {
      log("Arguments is not a DataForSendAndBuildDocx");
    }
    _dataForSendAndBuildDocx = args as DataForSendAndBuildDocx;

  }

  @override
  Widget build(BuildContext context) {
    final sendAndLoadingFileBloc = SendAndLoadingFileBloc();

    return MultiBlocProvider(
      providers: [
        BlocProvider<SendAndLoadingFileBloc>(
            create: (context) => sendAndLoadingFileBloc)
      ],
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  sendAndLoadingFileBloc.add(SendDataAndLoadingFile(_dataForSendAndBuildDocx));
                },
                child: const Text("Сгенерировать и скачать файл"),
              ),
              BlocBuilder<SendAndLoadingFileBloc, SendAndLoadingFileState>(
                bloc: sendAndLoadingFileBloc,
                builder: (context, state) {
                  return Column(
                    children: [
                      if (state is SendDataState)
                        const Text(
                            "Данные отправляются на сервер для генерации документа")
                      else if (state is BuildingDocxState)
                        const Text("Формируем документ")
                      else if (state is LoadingDocxState)
                        const Text("Скачиваем!")
                      else
                        const Text("Внимание, произошла ошибка")
        
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}