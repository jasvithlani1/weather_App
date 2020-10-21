import 'package:flutter/material.dart';
import 'package:forecast/model/forecast_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forecast/util/convert_icon.dart';
import 'package:forecast/util/forecast_util.dart';

Widget foreCastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayofweek = "";
  DateTime date =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayofweek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayofweek),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
              weatherDescription: forecastList[index].weather[0].main,
              color: Colors.pinkAccent,
              size: 45,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastList[index].temp.min.toStringAsFixed(0)}F"),
                  ),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.white,
                    size: 17,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text('${forecastList[index].temp.max.toString()} F'),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleUp,
                      color: Colors.white,
                      size: 17,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                        "Hum:${forecastList[index].humidity.toStringAsFixed(0)} %")
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "Win: ${forecastList[index].speed.toStringAsFixed(1)} mi/h")
                    ],
                  ))
            ],
          )
        ],
      )
    ],
  );
}
