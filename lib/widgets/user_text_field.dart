import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class UserTextField extends StatelessWidget {
  const UserTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (city) {
        if (city.isNotEmpty) {
          context.read<GetWeatherCubit>().getCurrentWeather(city: city);
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Please enter a city name',
                style: TextStyle(fontSize: 22),
              ),
            ),
          );
        }
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 27,
          horizontal: 10,
        ),
        label: const Text(
          'Search',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        hintText: 'Enter City Name',
        hintStyle: const TextStyle(fontSize: 20),
        suffixIcon: const Icon(Icons.search, size: 35),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}
