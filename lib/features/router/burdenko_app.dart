import 'package:flutter/material.dart';
import 'package:burdenko/features/theme/theme.dart';
import 'package:burdenko/features/router/routes.dart';

final rootKey = GlobalKey<NavigatorState>();
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
      theme: lightTheme,
    );
  }
}