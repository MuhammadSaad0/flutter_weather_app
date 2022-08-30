import 'package:flutter/material.dart';
import 'package:flutter_weather/models/WeatherDataObj.dart';
import 'package:flutter_weather/widgets/vertical_bar_widget.dart';

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
      const SizedBox(
        height: 30,
      ),
      const Text(
        "Todays Forecast",
        style: TextStyle(fontSize: 18),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(border: Border.all(width: 1)),
        width: 300,
        height: 240,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (int i = 0;
                  i < widget.current_WeatherObj!.daily_forecast.length;
                  i++)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: VerticalBar(
                      input_temp: widget.current_WeatherObj!.daily_forecast[i],
                      png: widget.current_WeatherObj!.daily_pngs[i]),
                )
            ],
          ),
        ]),
      )
    ]);
  }
}
