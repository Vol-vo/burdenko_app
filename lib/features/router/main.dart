import 'package:flutter/material.dart';
import 'package:burdenko/features/dnevnik/view/main_screen.dart';

const buttonColor = Color(0xff191919);
const orangecolor = Color(0xffD9802E);

void main() {
  runApp(MyApp());
}

final rootKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
