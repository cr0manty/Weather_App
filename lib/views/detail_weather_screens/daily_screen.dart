import 'package:flutter/material.dart';
import 'package:weather_app/models/daily/forecast.dart';
import 'package:weather_app/views/detail_weather_screens/widgets/row_element.dart';
import 'package:weather_app/views/home/widgets/daily_weather_time_line.dart';

class DetailDailyWeatherScreen extends StatelessWidget {
  final DailyWeatherForecast forecast;

  DetailDailyWeatherScreen(this.forecast);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(forecast.dateString),
      ),
      body: ListView(
        children: [
          RowWeatherElement(
            labelKey: 'date',
            value: Text(forecast.dateString),
          ),
          RowWeatherElement(
            labelKey: 'feels_like',
            value: DailyWeatherTimeLine(
              label: forecast.feelsLike.dayInt.toString(),
              icon: Icons.wb_sunny,
            ),
            additionElement: DailyWeatherTimeLine(
              label: forecast.feelsLike.nightInt.toString(),
              icon: Icons.nightlight_round,
            ),
          ),
          RowWeatherElement(
            labelKey: 'sunset',
            value: Text(forecast.sunsetString),
          ),
          RowWeatherElement(
            labelKey: 'sunrice',
            value: Text(forecast.sunriseString),
          ),
          RowWeatherElement(
            labelKey: 'pressure',
            value: Text(forecast.pressure.toString()),
          ),
          RowWeatherElement(
            labelKey: 'humidity',
            value: Text(forecast.humidity.toString()),
          ),
          RowWeatherElement(
            labelKey: 'dew_point',
            value: Text('${forecast.dewPoint}°C'),
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
            value: Text('${forecast.pop}%'),
          ),
          RowWeatherElement(
            labelKey: 'uvi',
            value: Text('${forecast.uvi}'),
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
