class WeatherModel {
  final String cityName;
  final String country;
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
    required this.country,
    required this.image,
    required this.currentTemp,
    required this.description,
    required this.highTemp,
    required this.lowTemp,
    required this.windSpeed,
    required this.humidity,
    required this.uvIndex,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      country: json['location']['country'],
      image: json['current']['condition']['icon'],
      currentTemp: json['current']['temp_c'],
      description: json['current']['condition']['text'],
      highTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      lowTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      windSpeed: json['current']['wind_kph'],
      humidity: json['current']['humidity'],
      uvIndex: json['current']['uv'],
    );
  }
}
