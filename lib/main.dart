import 'package:bit_tracker/screens/home.dart';
import 'package:bit_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    theme: ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        color: kThemePriColor,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: kScaffoldBackground,
      primaryColor: kPrimaryColor,
    ),
  ));
}
