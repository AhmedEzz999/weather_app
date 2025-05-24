import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  void getCurrentWeather({required String city}) async {
    try {
      final WeatherModel weatherCity = await WeatherService().getCurrentWeather(
        cityName: city,
      );
      emit(CurrentWeather(currentWeather: weatherCity));
    } catch (e) {
      emit(WeatherFailure(errorMessage: e.toString()));
    }
  }
}
