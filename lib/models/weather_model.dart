class WeatherModel {
  final String cityName;
  final String country;
  final double currentTemp;
  final String condition;
  final String updatedAt;
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
    required this.updatedAt,
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
      updatedAt: json['current']['last_updated'].substring(11, 16) ?? '',
      highTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'] ?? 0,
      lowTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'] ?? 0,
      windSpeed: json['current']['wind_kph'] ?? 0,
      humidity: json['current']['humidity'] ?? 0,
      uvIndex: json['current']['uv'] ?? 0,
    );
  }
}
