import 'package:bit_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

class PriceContainer extends StatelessWidget {
  final String unit;
  final String value;
  final String metric;

  PriceContainer({@required this.unit, @required this.value, this.metric});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 3.0,
        )
      ], borderRadius: BorderRadius.circular(5), color: kPrimaryColor),
      child: Center(child: Text("1 $unit = $value $metric")),
    );
  }
}
