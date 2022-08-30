class WeatherObj {
  final double current_temp;
  final double feels_like_temp;
  final String weather_description;
  final String area_name;
  final humidity;
  List daily_forecast;
  List daily_pngs;

  WeatherObj(
      {required this.current_temp,
      required this.feels_like_temp,
      required this.weather_description,
      required this.area_name,
      required this.humidity,
      required this.daily_forecast,
      required this.daily_pngs});
  factory WeatherObj.fromJson(
      Map<String, dynamic> json, Map<String, dynamic> forecast) {
    List forecast_list = [];
    List pngs_list = [];
    for (int i = 0; i < 24; i += 2) {
      forecast_list
          .add(forecast["forecast"]["forecastday"][0]["hour"][i]["temp_c"]);
      pngs_list.add(forecast["forecast"]["forecastday"][0]["hour"][i]
          ["condition"]["icon"]);
    }

    return WeatherObj(
        current_temp: json["main"]["temp"],
        feels_like_temp: json["main"]["feels_like"],
        weather_description: json["weather"][0]["main"],
        area_name: json["name"],
        humidity: json["main"]["humidity"],
        daily_forecast: forecast_list,
        daily_pngs: pngs_list);
  }
}
