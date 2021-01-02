import 'dart:convert';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;

const String apiUrl = 'https://data.messari.io/api/v1/assets/';

class CoinData {
  List<String> coinNames;
  Map _result;

  CoinData({@required this.coinNames});

  Future<String> sendApiRequest(String coinName) async {
    print("object");
    try {
      String apiUrl = 'https://data.messari.io/api/v1/assets/$coinName/metrics';
      http.Response response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body)['data']['market_data'];
        print(data);
        print(data['price_usd'].toStringAsFixed(4));
        return data['price_usd'].toStringAsFixed(4);
      } else {
        return "?";
      }
    } catch (e) {
      return "?";
    }
  }

  Future<Map> getCurrentPrices() async {
    List<String> response = await Future.wait(
        coinNames.map((element) => sendApiRequest(element)).toList());
    return Map.fromIterables(coinNames, response);
  }
}
