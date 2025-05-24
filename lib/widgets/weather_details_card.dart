import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/theme/text_styles.dart';

class WeatherDetailsCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherDetailsCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF328EB3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('High / Low', style: TextStyles.weatherDetails()),
              Text(
                '${weather.highTemp.toStringAsFixed(0)}° / ${weather.lowTemp.toStringAsFixed(0)}°',
                style: TextStyles.weatherDetails(),
              ),
            ],
          ),
          const Divider(thickness: 0.7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Wind', style: TextStyles.weatherDetails()),
              Text(
                '${weather.windSpeed.toStringAsFixed(0)} km/h',
                style: TextStyles.weatherDetails(),
              ),
            ],
          ),
          const Divider(thickness: 0.7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Humidity', style: TextStyles.weatherDetails()),
              Text(
                '${weather.humidity.toStringAsFixed(0)}%',
                style: TextStyles.weatherDetails(),
              ),
            ],
          ),
          const Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('UV Index', style: TextStyles.weatherDetails()),
              Text(
                weather.uvIndex.toStringAsFixed(0),
                style: TextStyles.weatherDetails(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
