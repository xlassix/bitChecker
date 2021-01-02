import 'package:bit_tracker/components/currencySelector.dart';
import 'package:bit_tracker/components/priceContainer.dart';
import 'package:bit_tracker/utils/coinData.dart';
import 'package:bit_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Map data;
  HomeScreen({@required this.data});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currencyName = "USD";
  Map data;
  Map exchangeData;
  double selectedExchangeRate;

  CoinData instance = CoinData(coinNames: kCryptoList);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      exchangeData = widget.data;
    });
    updateCurrency(_currencyName);
  }

  void updateCurrency(String value) async {
    var temp = await instance.getCurrentPrices();
    print(exchangeData[value]);
    setState(() {
      selectedExchangeRate = exchangeData[value];
      _currencyName = value;
      data = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    data = data ??
        Map.fromIterables(kCryptoList, List.filled(kCryptoList.length, "?"));
    return Scaffold(
      appBar: AppBar(
        title: Text("BitTracker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: data.entries.map((element) {
              print(element);
              return PriceContainer(
                unit: element.key,
                value:
                    exchangeData[_currencyName] == null || element.value == "?"
                        ? "?"
                        : (double.parse(element.value) *
                                exchangeData[_currencyName])
                            .toStringAsFixed(4),
                metric: _currencyName,
              );
            }).toList(),
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
