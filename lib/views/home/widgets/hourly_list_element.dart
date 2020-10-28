import 'package:flutter/material.dart';
import 'package:weather_app/models/hourly/forecast.dart';
import 'package:weather_app/utils/image_view.dart';
import 'package:weather_app/utils/localization.dart';

class HourlyListElement extends StatelessWidget {
  final HourlyWeatherForecast forecast;

  HourlyListElement(this.forecast);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: ImageView(
                forecast.weather?.iconUrl,
              ),
            ),
            Text(
              forecast.timeString,
            ),
            SizedBox(height: 10),
            Text(forecast.temp.round().toString()),
            SizedBox(height: 10),
            Column(
              children: [
                Text(
                  AppLocalizations.of(context).translate('feels_like'),
                ),
                SizedBox(height: 3),
                Text(forecast.feelsLike.round().toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
