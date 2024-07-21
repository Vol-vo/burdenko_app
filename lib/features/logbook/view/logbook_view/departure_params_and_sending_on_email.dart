import 'package:burdenko/core/models/model_for_department/data_for_send_and_build_docx/data_for_send_and_build_docx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

import '../../bloc/send_and_loading_file/send_and_loading_file_bloc.dart';

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
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            for (int i = 0;
                i < _dataForSendAndBuildDocx.department.params.length;
                i++)
              Text(
                  "${_dataForSendAndBuildDocx.department.params[i].title} ${_dataForSendAndBuildDocx.department.params[i].getValue()}"),
            ElevatedButton(
              onPressed: () {
                final sendAndLoadingFileBloc =
                    context.read<SendAndLoadingFileBloc>();
                sendAndLoadingFileBloc
                    .add(SendDataAndLoadingFileEvent(_dataForSendAndBuildDocx));
              },
              child: const Text("Сформировать и загрузить документ"),
            ),
            BlocBuilder<SendAndLoadingFileBloc, SendAndLoadingFileState>(
              builder: (context, state) {
                var bloc = context.watch<SendAndLoadingFileBloc>();
                return Column(
                  children: [
                    if (bloc.state is DefaultState)
                      const Text(" ")
                    else if (bloc.state is SendDataState)
                      const Text(
                          "Файл успешно скачен")
                    else
                      const Text("Внимание, произошла ошибка")
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
