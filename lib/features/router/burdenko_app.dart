import 'package:flutter/material.dart';
import 'package:burdenko/features/router/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logbook/models/bloc/send_and_loading_file/send_and_loading_file_bloc.dart';

final rootKey = GlobalKey<NavigatorState>();

class Wrapper extends StatelessWidget{
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SendAndLoadingFileBloc>(
          create: (context) => SendAndLoadingFileBloc())
    ], child: const BurdenkoApp());
  }
}

class BurdenkoApp extends StatelessWidget {
  const BurdenkoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootKey,
      debugShowCheckedModeBanner: false,
      title: 'Burdenko',
      routes: routes,
    );
  }
}