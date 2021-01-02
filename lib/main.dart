import 'package:bit_tracker/screens/loading.dart';
import 'package:bit_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Loading(),
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
