import 'package:bitcoinchecker/services/networking.dart';

String apikey = 'B03B9491-A00D-482A-B825-BA9A52A2B5C8';
String url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apkikey=$apikey';

class CryptoModel{

  Future<dynamic> getExchangeRate(String currency)async{

    NetworkHelper networkHelper = NetworkHelper(url);
    var exchangeRateData = await networkHelper.getData();

    return exchangeRateData;

  }
}