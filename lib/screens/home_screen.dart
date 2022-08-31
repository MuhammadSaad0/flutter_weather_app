import 'package:flutter/material.dart';
import 'package:flutter_weather/models/WeatherDataObj.dart';
import 'package:flutter_weather/utils/weather_functions.dart';
import 'package:flutter_weather/widgets/weather_display_widget.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:snowfall/snowfall.dart';
import 'package:parallax_rain/parallax_rain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

WeatherObj? current_WeatherObj;
bool dataLoaded = false;

class _HomeScreenState extends State<HomeScreen> {
  void callWeatherFunc() async {
    current_WeatherObj = await getLocData();
    setState(() {
      dataLoaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callWeatherFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: dataLoaded
          ? BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      current_WeatherObj!.weather_description == "Haze" ||
                              current_WeatherObj!.weather_description == "Dust"
                          ? "./images/haze.jpg"
                          : current_WeatherObj!.weather_description == "Smoke"
                              ? "./images/smoke.jpg"
                              : current_WeatherObj!.weather_description == "Fog"
                                  ? "./images/fog.jpg"
                                  : current_WeatherObj!.weather_description ==
                                          "Clouds"
                                      ? "./images/cloud.jpg"
                                      : "./images/clear.jpg"),
                  fit: BoxFit.cover))
          : null,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: dataLoaded
              ? current_WeatherObj!.weather_description == "Rain" ||
                      current_WeatherObj!.weather_description ==
                          "ThunderStorm" ||
                      current_WeatherObj!.weather_description == "Drizzle"
                  ? RainfallHome()
                  : current_WeatherObj!.weather_description == "Snow"
                      ? SnowfallHome()
                      : RegularHome()
              : const Center(child: CircularProgressIndicator())),
    );
  }
}

class RegularHome extends StatelessWidget {
  const RegularHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: dataLoaded
          ? GlassContainer(
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
              child: WeatherDisplay(
                current_WeatherObj: current_WeatherObj,
              ))
          : const CircularProgressIndicator(),
    );
  }
}

class SnowfallHome extends StatelessWidget {
  const SnowfallHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnowfallWidget(
      child: Center(
        child: dataLoaded
            ? GlassContainer(
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
                child: WeatherDisplay(
                  current_WeatherObj: current_WeatherObj,
                ))
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class RainfallHome extends StatelessWidget {
  const RainfallHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParallaxRain(
      dropWidth: 0.7,
      dropHeight: 5,
      dropFallSpeed: 3,
      dropColors: [Colors.blue, Colors.blueGrey, Colors.lightBlue],
      child: Center(
        child: dataLoaded
            ? GlassContainer(
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
                child: WeatherDisplay(
                  current_WeatherObj: current_WeatherObj,
                ))
            : const CircularProgressIndicator(),
      ),
    );
  }
}
