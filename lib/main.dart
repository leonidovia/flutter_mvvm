import 'package:flutter/material.dart';
import 'package:flutter_mvvm/services/di/service_locator.dart';
import 'package:flutter_mvvm/view_models/di/view_model_locator.dart';
import 'package:flutter_mvvm/views/user_info/user_game_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

void configureDependencies() {
  configureServiceDependencies();
  configureViewModelDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: UserGamePage(),
    );
  }
}