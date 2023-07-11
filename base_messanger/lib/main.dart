import 'package:base_messanger/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:base_messanger/LoginPage.dart';
import 'package:base_messanger/GlobalVariables.dart' as gv;

void main() async {

  if (gv.loginFlag) {
    runApp(
      MaterialApp(home: MainPage(),),
    );
  } else {
    runApp(
      const MaterialApp(home: LoginPage(),),
    );
  }
}