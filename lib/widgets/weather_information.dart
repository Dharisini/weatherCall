import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key})
      : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Container(
          child: Center(
            child: Image.network(
              'http://openweathermap.org/img/wn/${weatherModel.weather.first.icon}@2x.png',
            ),
          ),
          color: Color.fromARGB(255, 186, 150, 207),
        ),
        const SizedBox(height: 5),
        Container(
          child: Text('${weatherModel.main.temp}°C'),
          color: Color.fromARGB(255, 198, 124, 211),
          alignment: Alignment.centerLeft,
        ),
        const SizedBox(height: 5),
        Container(
          child: Text('${weatherModel.main.temp}°C'),
          color: Color.fromARGB(255, 198, 124, 211),
          alignment: Alignment.centerLeft,
        ),
        const SizedBox(height: 10),
        Text('${weatherModel.name}'),
        const SizedBox(height: 10),
        Text('${weatherModel.weather.first.description}'),
        const SizedBox(height: 10),
        Text('But it feels like ${weatherModel.main.feelsLike}'),
      ]),
    );
  }
}
