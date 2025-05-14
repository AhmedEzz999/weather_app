import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio _dio = Dio();

  Future<WeatherModel> getWeather(String cityName) async {
    final response = await _dio.get(
      'https://api.weatherapi.com/v1/forecast.json?key=81e6586c2127439ab99165258251305 &q=$cityName&days=1',
    );
    final Map<String, dynamic> jsonData = response.data;
    return WeatherModel.fromJson(jsonData);
  }
}
