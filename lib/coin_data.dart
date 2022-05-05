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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'B03B9491-A00D-482A-B825-BA9A52A2B5C8';

class CoinData {
  //3. Create the Asynchronous method getCoinData() that returns a Future (the price data).
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';

      http.Response response = await http.get(Uri.parse(requestURL));

      //6. Check that the request was successful.
      if (response.statusCode == 200) {
        //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        //10. Handle any errors that occur during the request.
        print(response.statusCode);
        //Optional: throw an error if our request fails.
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
