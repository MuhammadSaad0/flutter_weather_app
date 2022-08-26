import 'dart:convert';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import '../models/WeatherDataObj.dart';

getLocData() async {
  Location location = Location();

  late bool serviceEnabled;
  late PermissionStatus permissionGranted;
  late LocationData locationData;

  location.changeSettings();
  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  locationData = await location.getLocation();

  var result = await (http.get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=3359feef40522cf41e54bdf8770a0ef5&units=metric")));
  return WeatherObj.fromJson(jsonDecode(result.body));
}
