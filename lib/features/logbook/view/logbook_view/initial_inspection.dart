import 'package:burdenko/core/models/model_for_department/data_for_send_and_build_docx/data_for_send_and_build_docx.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:burdenko/features/logbook/view/widgets/params_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/models/model_for_department/department/department.dart';
import '../../bloc/clear_params/clear_params_bloc.dart';
import '../../bloc/write_base_value_in_params/write_base_value_in_params_bloc.dart';

class InitialInspection extends StatefulWidget {
  const InitialInspection({super.key});

  @override
  State<StatefulWidget> createState() => _InitialInspectionState();
}

class _InitialInspectionState extends State<InitialInspection> {
  late Department _department;
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
    _department = _dataForSendAndBuildDocx.department;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(data: _dataForSendAndBuildDocx),
        body: SafeArea(
            child: ListView(
            children: [
              ElevatedButton(
                  onPressed: (){
                    final clearParams =
                    context.read<ClearParamsBloc>();
                    clearParams
                        .add(ClearEvent(params: _department.params));
                  },
                  child: const Text("Удалить все значения")
              ),
              ElevatedButton(
                  onPressed: (){
                    final writeBaseValueInParams =
                    context.read<WriteBaseValueInParamsBloc>();
                    writeBaseValueInParams
                        .add(WriteValueInParamsEvent(_department.params));

                  },
                  child: const Text("Вставить базовые значения")
              ),
              for (var widget in _department.params)
                Params(parameter: widget, department: _department)
            ],
          ),
        ));
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  const CustomAppBar({super.key, required DataForSendAndBuildDocx data}) : dataForSendAndBuildDocx = data;

  final DataForSendAndBuildDocx dataForSendAndBuildDocx;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _CustomAppBarState extends State<CustomAppBar> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
            iconSize: 40),
        IconButton(
            onPressed: () {
              if (widget.dataForSendAndBuildDocx.isReadyForSendAndBuildDocx()) {
                Navigator.pushNamed(
                    context,
                    "/departureParamsAndSendingOnEmail",
                    arguments: widget.dataForSendAndBuildDocx
                );
              }else{
                Fluttertoast.showToast(
                  gravity: ToastGravity.TOP,
                  msg: "Вы не вписали обязательные значения",
                  timeInSecForIosWeb: 10,
                  backgroundColor: Colors.blue,
                  fontSize: 20

                );
              }
            },
            icon: const Icon(Icons.upload_file_sharp),
            iconSize: 40)
      ],
    ));
  }
}
