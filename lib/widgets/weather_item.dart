import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/models/weather_model.dart';
import 'weather_details_card.dart';

class WeatherItem extends StatelessWidget {
  final WeatherModel weather;
  const WeatherItem({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0F6F9D),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Text(
                '${weather.cityName}, ${weather.country}',
                style: const TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                weather.getWeatherIcon(weather.condition),
                width: 200,
                height: 200,
              ),
              Text(
                '${weather.currentTemp.toStringAsFixed(0)}°',
                style: const TextStyle(fontSize: 100, color: Colors.white),
              ),
            ],
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              weather.condition,
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Updated at ${weather.get12HourTime(weather.date)}',
            style: const TextStyle(fontSize: 40, color: Colors.white),
          ),
          WeatherDetailsCard(weather: weather),
        ],
      ),
    );
  }
}
