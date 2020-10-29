import 'package:flutter/material.dart';
import 'package:weather_app/models/hourly/forecast.dart';
import 'package:weather_app/views/detail_weather_screens/widgets/row_element.dart';

class DetailHourlyWeatherScreen extends StatelessWidget {
  final HourlyWeatherForecast forecast;
  final int timeOffset;

  DetailHourlyWeatherScreen(this.forecast, this.timeOffset);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(forecast.dateTimeString(timeOffset)),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          RowWeatherElement(
            labelKey: 'temp',
            value: Text('${forecast.intTemp}°C'),
          ),
          RowWeatherElement(
            labelKey: 'feels_like',
            value: Text('${forecast.intFeelsLike}°C'),
          ),
          RowWeatherElement(
            labelKey: 'pressure',
            value: Text(forecast.pressure.toString()),
          ),
          RowWeatherElement(
            labelKey: 'humidity',
            value: Text('${forecast.humidity}%'),
          ),
          RowWeatherElement(
            labelKey: 'dew_point',
            value: Text('${forecast.dewPoint.round()}°C'),
          ),
          RowWeatherElement(
            labelKey: 'wind_speed',
            value: Text(forecast.windSpeed.toString()),
          ),
          RowWeatherElement(
            labelKey: 'wind_deg',
            value: Text(forecast.windDeg.toString()),
          ),
          RowWeatherElement(
            labelKey: 'clouds',
            value: Text('${forecast.clouds}%'),
          ),
          RowWeatherElement(
            labelKey: 'pop',
            value: Text('${forecast.pop.round()}%'),
          ),
          RowWeatherElement(
            labelKey: 'uvi',
            value: Text('${forecast.uvi}'),
          ),
          RowWeatherElement(
            labelKey: 'visibility',
            value: Text('${forecast.visibility}'),
          ),
          RowWeatherElement(
            labelKey: 'rain/snow',
            value: Text('${forecast.rainOrSnow}%'),
          ),
        ],
      ),
    );
  }
}
