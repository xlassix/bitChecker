import 'dart:convert';
import "package:http/http.dart" as http;

const String apiUrl = 'https://api.exchangeratesapi.io/latest?base=USD';

class ExchangeData {
  Map data;

  Future<Map> getExchangeRate() async {
    try {
      http.Response response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body)['rates'];
        print(data);
        return data;
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }

}
