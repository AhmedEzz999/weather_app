class WeatherModel {
  final String cityName;
  final String country;
  final double currentTemp;
  final String condition;
  final DateTime date;
  final double highTemp;
  final double lowTemp;
  final double windSpeed;
  final int humidity;
  final double uvIndex;

  WeatherModel({
    required this.cityName,
    required this.country,
    required this.currentTemp,
    required this.condition,
    required this.date,
    required this.highTemp,
    required this.lowTemp,
    required this.windSpeed,
    required this.humidity,
    required this.uvIndex,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'] ?? '',
      country: json['location']['country'] ?? '',
      currentTemp: json['current']['temp_c'] ?? 0,
      condition: json['current']['condition']['text'] ?? '',
      date:
          DateTime.tryParse(json['current']['last_updated'] ?? '') ??
          DateTime.now(),
      highTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'] ?? 0,
      lowTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'] ?? 0,
      windSpeed: json['current']['wind_kph'] ?? 0,
      humidity: json['current']['humidity'] ?? 0,
      uvIndex: json['current']['uv'] ?? 0,
    );
  }

  String get12HourTime(DateTime time) {
    final int hour = time.hour;
    final String minutes = time.minute == 0 ? '00' : time.minute.toString();
    final String period = hour < 12 ? 'AM' : 'PM';
    final int hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$hour12:$minutes $period';
  }

  String getWeatherIcon(String condition) {
    if (condition.contains('Cloudy') ||
        condition.contains('Fog') ||
        condition.contains('Mist') ||
        condition.contains('cloudy')) {
      return 'assets/images/cloudy.svg';
    } else if (condition.contains('Sunny') || condition.contains('Clear')) {
      return 'assets/images/sunny.svg';
    } else if (condition.contains('Overcast')) {
      return 'assets/images/overcast.svg';
    } else if (condition.contains('Rain') || condition.contains('rain')) {
      return 'assets/images/rainy.svg';
    } else if (condition.contains('Snow')) {
      return 'assets/images/snowy.svg';
    } else if (condition.contains('Thunder')) {
      return 'assets/images/thunder.svg';
    } else {
      return (date.hour >= 6 && date.hour < 18)
          ? 'assets/images/sunny.svg'
          : 'assets/images/night.svg';
    }
  }
}
