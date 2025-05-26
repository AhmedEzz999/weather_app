import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}

MaterialColor getWeatherColor(String condition) {
  final lcCondition = condition.toLowerCase();

  if (lcCondition.contains('sunny') || lcCondition.contains('clear')) {
    return Colors.amber;
  }

  if (lcCondition.contains('partly cloudy')) {
    return Colors.blueGrey;
  }

  if (lcCondition.contains('cloudy') || lcCondition.contains('overcast')) {
    return Colors.grey;
  }

  if (lcCondition.contains('mist') || lcCondition.contains('fog')) {
    return Colors.blueGrey;
  }

  if (lcCondition.contains('rain') || lcCondition.contains('drizzle')) {
    if (lcCondition.contains('heavy') || lcCondition.contains('torrential')) {
      return Colors.blue;
    }

    if (lcCondition.contains('freezing')) {
      return Colors.lightBlue;
    }

    return Colors.blue;
  }

  if (lcCondition.contains('snow') ||
      lcCondition.contains('sleet') ||
      lcCondition.contains('blizzard')) {
    return Colors.blue;
  }

  if (lcCondition.contains('thunder') || lcCondition.contains('thundery')) {
    return Colors.deepPurple;
  }

  if (lcCondition.contains('ice') || lcCondition.contains('hail')) {
    return Colors.lightBlue;
  }

  return Colors.indigo;
}
