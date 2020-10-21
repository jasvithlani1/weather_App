import 'package:forecast/model/forecast_model.dart';
import 'package:forecast/util/forecast_util.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecastModel(
      {String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q=" +
        cityName +
        "&appid=" +
        Util.appId +
        "&units=imperial";

    final response = await get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
