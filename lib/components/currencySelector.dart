import 'package:bit_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

class CurrencySelector extends StatelessWidget {
  final Function onPress;
  final String currentValue;

  CurrencySelector({this.currentValue, this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: kThemePriColor,
      child: Center(
          child: DropdownButton(
        value: currentValue,
        items: kCurrenciesList
            .map((element) => DropdownMenuItem(
                  value: element,
                  child: Text(element,textAlign: TextAlign.center,),
                ))
            .toList(),
        onChanged: (value) {
          onPress(value);
        },
      )),
    );
  }
}
