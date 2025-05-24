import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/empty_view.dart';
import 'package:weather_app/widgets/weather_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4586B4),
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchView()),
                );
              },
              child: const Icon(Icons.search, size: 35),
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const EmptyView();
          } else if (state is CurrentWeather) {
            return WeatherItem(weather: state.currentWeather);
          } else if (state is WeatherFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(fontSize: 27),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'There is an error, try again later',
                style: TextStyle(fontSize: 27),
              ),
            );
          }
        },
      ),
    );
  }
}
