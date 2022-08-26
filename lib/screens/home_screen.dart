import 'package:flutter/material.dart';
import 'package:flutter_weather/models/WeatherDataObj.dart';
import 'package:flutter_weather/utils/weather_functions.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

WeatherObj? current_WeatherObj;

void callWeatherFunc() async {
  current_WeatherObj = await getLocData();
  print(current_WeatherObj!.area_name);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    callWeatherFunc();
    return Scaffold(
      body: Center(
        child: GlassContainer(
          height: 500,
          width: 320,
          blur: 5,
          color: Colors.white.withOpacity(0.6),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(174, 3, 168, 244).withOpacity(0.5),
              const Color.fromARGB(255, 49, 122, 249).withOpacity(0.4),
            ],
          ),
          //--code to remove border
          border: const Border.fromBorderSide(BorderSide.none),
          shadowStrength: 12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
          shadowColor: Colors.black.withOpacity(0.18),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Text(current_WeatherObj!.area_name),
          ]),
        ),
      ),
    );
  }
}
