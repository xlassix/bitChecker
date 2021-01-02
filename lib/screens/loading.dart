import 'package:bit_tracker/screens/home.dart';
import 'package:bit_tracker/utils/exchangeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitPulse;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  ExchangeData instance;
  Map data;

  void getData(ExchangeData instance) async {
    try {
      data = await instance.getExchangeRate();
      if (data.isEmpty) {
        return getData(instance);
      }
      print(data);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen(data: data);
      }));
    } catch (e) {
      return getData(instance);
    }
  }

  @override
  void initState() {
    super.initState();
    instance = ExchangeData();
    getData(instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Welcome bitTracker",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20.0,
          ),
          SpinKitPulse(
            color: Colors.white,
            size: 80.0,
          )
        ],
      ),
    );
  }
}
