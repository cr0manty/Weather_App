import 'package:flutter/material.dart';
import 'package:weather_app/models/daily/forecast.dart';
import 'package:weather_app/utils/image_view.dart';
import 'package:weather_app/utils/localization.dart';
import 'package:weather_app/views/detail_weather_screens/daily_screen.dart';

import 'daily_weather_time_line.dart';

class DailyListElement extends StatelessWidget {
  final DailyWeatherForecast forecast;

  DailyListElement(this.forecast);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailDailyWeatherScreen(forecast),
          ),
        );
      },
      child: Card(
        color: Color(0xe8e8e8).withOpacity(0.9),
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
                forecast.dateString,
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  DailyWeatherTimeLine(
                    label: forecast.temp.dayInt.toString(),
                    icon: Icons.wb_sunny,
                  ),
                  DailyWeatherTimeLine(
                    label: forecast.temp.nightInt.toString(),
                    icon: Icons.nightlight_round,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context).translate('feels_like'),
                  ),
                  SizedBox(height: 3),
                  DailyWeatherTimeLine(
                    label: forecast.temp.dayInt.toString(),
                    icon: Icons.wb_sunny,
                  ),
                  DailyWeatherTimeLine(
                    label: forecast.temp.nightInt.toString(),
                    icon: Icons.nightlight_round,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
