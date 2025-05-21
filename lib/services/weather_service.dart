import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio _dio = Dio();
  final String _apiKey = '81e6586c2127439ab99165258251305';
  final String _baseUrl = 'https://api.weatherapi.com/v1';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      final Response response = await _dio.get(
        '$_baseUrl/forecast.json?key=$_apiKey&q=$cityName&days=1',
      );
      final Map<String, dynamic> jsonData = response.data;
      return WeatherModel.fromJson(jsonData);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'There is an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
