import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../features/logbook/bloc/clear_params/clear_params_bloc.dart';
import '../../../features/logbook/bloc/send_and_loading_file/send_and_loading_file_bloc.dart';
import '../../../features/logbook/bloc/write_base_value_in_params/write_base_value_in_params_bloc.dart';
import 'routes.dart';


final rootKey = GlobalKey<NavigatorState>();

class Wrapper extends StatelessWidget{
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SendAndLoadingFileBloc>(
          create: (context) => SendAndLoadingFileBloc()),
      BlocProvider<WriteBaseValueInParamsBloc>(create: (context) => WriteBaseValueInParamsBloc()),
      BlocProvider<ClearParamsBloc>(create: (context) => ClearParamsBloc())
    ], child: const BurdenkoApp());
  }
}

class BurdenkoApp extends StatelessWidget {
  const BurdenkoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: FToastBuilder(),
      navigatorKey: rootKey,
      debugShowCheckedModeBanner: false,
      title: 'Burdenko',
      routes: routes,
    );
  }
}