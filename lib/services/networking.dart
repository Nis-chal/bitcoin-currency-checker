import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);

      // double condition = jsonDecode(data)['weather'][0]['id'];
      // int tempreture = jsonDecode(data)['main']['temp'];
      // String cityName = jsonDecode(data)['name'];

      // var longitude = jsonDecode(data)['coord']['lon'];
      // var weatherDescription = jsonDecode(data)['weather'][0]['main'];
      // print(weatherDescription);
    } else {
      print(response.statusCode);
    }
  }
}
