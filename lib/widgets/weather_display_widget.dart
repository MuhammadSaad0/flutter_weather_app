import 'package:flutter/material.dart';
import 'package:flutter_weather/models/WeatherDataObj.dart';

class WeatherDisplay extends StatefulWidget {
  WeatherObj? current_WeatherObj;
  WeatherDisplay({Key? key, required this.current_WeatherObj})
      : super(key: key);

  @override
  State<WeatherDisplay> createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      Text(
        widget.current_WeatherObj!.area_name,
        style: const TextStyle(fontSize: 22),
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.current_WeatherObj!.current_temp.toString()}°C",
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        "Feels Like: ${widget.current_WeatherObj!.feels_like_temp}°C",
        style: const TextStyle(fontSize: 14),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(widget.current_WeatherObj!.weather_description),
    ]);
  }
}
