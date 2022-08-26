class WeatherObj {
  final double current_temp;
  final double feels_like_temp;
  final String weather_description;
  final String area_name;
  final humidity;

  const WeatherObj({
    required this.current_temp,
    required this.feels_like_temp,
    required this.weather_description,
    required this.area_name,
    required this.humidity,
  });
  factory WeatherObj.fromJson(Map<String, dynamic> json) {
    return WeatherObj(
        current_temp: json["main"]["temp"],
        feels_like_temp: json["main"]["feels_like"],
        weather_description: json["weather"][0]["description"],
        area_name: json["name"],
        humidity: json["main"]["humidity"]);
  }
}
