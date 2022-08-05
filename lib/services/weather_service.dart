import 'package:weather_app/models/weather_model.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  //futures aer similar to promiss function

  Future<WeatherModel> fetchWeatherInformation(String cityName) async {
    const String apiKey = '7aa95ee2a18e5952f23cad118cdf1221';

    final Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.body);
    } else {
      throw Exception('failed to load the weather information');
    }
  }
}
