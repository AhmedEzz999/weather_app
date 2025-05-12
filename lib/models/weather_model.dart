class WeatherModel {
  final String cityName;
  final String image;
  final int currentTemp;
  final String description;
  final int highTemp;
  final int lowTemp;
  final int windSpeed;
  final int humidity;
  final int uvIndex;

  WeatherModel({
    required this.cityName,
    required this.image,
    required this.currentTemp,
    required this.description,
    required this.highTemp,
    required this.lowTemp,
    required this.windSpeed,
    required this.humidity,
    required this.uvIndex,
  });
}
