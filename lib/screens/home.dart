import 'package:bit_tracker/components/currencySelector.dart';
import 'package:bit_tracker/components/priceContainer.dart';
import 'package:bit_tracker/utils/coinData.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currencyName = "USD";

  void updateCurrency(String value) {
    setState(() {
      _currencyName = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    CoinData instance = CoinData(coinNames: ["67", "ETH", "btc"]);
    instance.getCurrentPrices();
    return Scaffold(
      appBar: AppBar(
        title: Text("BitTracker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PriceContainer(
            unit: "BTC",
            value: "23424",
            metric: "USD",
          ),
          CurrencySelector(
            currentValue: _currencyName,
            onPress: updateCurrency,
          )
        ],
      ),
    );
  }
}
