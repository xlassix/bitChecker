import 'package:bit_tracker/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CurrencySelector extends StatelessWidget {
  final Function onPress;
  final String currentValue;

  DropdownButton customDropdown() {
    return DropdownButton(
      value: currentValue,
      items: kCurrenciesList
          .map((element) => DropdownMenuItem(
                value: element,
                child: Text(
                  element,
                  textAlign: TextAlign.center,
                ),
              ))
          .toList(),
      onChanged: (value) {
        onPress(value);
      },
    );
  }

  CupertinoPicker iosPicker() {
    return CupertinoPicker(
      itemExtent: kCurrenciesList.length.toDouble() * 1.5,
      onSelectedItemChanged: (value) {
        print(kCurrenciesList[value]);
      },
      backgroundColor: Colors.transparent,
      children: kCurrenciesList
          .map((element) => Text(
                element,
                textAlign: TextAlign.center,
              ))
          .toList(),
    );
  }

  CurrencySelector({this.currentValue, this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 80,
        color: kThemePriColor,
        child: Center(
          child: Platform.isAndroid ? customDropdown() : iosPicker(),
        ));
  }
}
