import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round2/UI/registration.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Registration(),
      theme: ThemeData.light().copyWith(),
    );
  }
}
