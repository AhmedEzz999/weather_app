import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class CurrentWeather extends WeatherState {
  final WeatherModel currentWeather;

  CurrentWeather({required this.currentWeather});
}

class EmptyText extends WeatherState {}

class WeatherFailure extends WeatherState {
  final String errorMessage;

  WeatherFailure({required this.errorMessage});
}
