import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const url = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CoinData {
  Future getCurData(String cur) async {
    Map<String, String> cryptoPrices = {};
    for (String curItem in cryptoList) {
      http.Response response = await http.get(Uri.parse('$url$curItem$cur'));
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body.toString());
        double lastPrice = decodeData['last'];
        cryptoPrices[curItem] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'proplem with the get request';
      }
    }
    print(cryptoPrices);
    return cryptoPrices;
  }
}
