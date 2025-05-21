import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class UserTextField extends StatelessWidget {
  const UserTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (city) async {
        weatherCity = await WeatherService().getCurrentWeather(cityName: city);
        Navigator.pop(context);
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

WeatherModel? weatherCity;
