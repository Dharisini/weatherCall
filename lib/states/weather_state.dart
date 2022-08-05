//4 states
import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

// class WeatherInitial extends WeatherState{}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  //this where the database is at
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

class WeatherError extends WeatherState {
  final String errorMessage;

  WeatherError({required this.errorMessage});
}
