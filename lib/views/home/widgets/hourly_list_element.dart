import 'package:flutter/material.dart';
import 'package:weather_app/models/hourly/forecast.dart';
import 'package:weather_app/utils/image_view.dart';
import 'package:weather_app/utils/localization.dart';
import 'package:weather_app/views/detail_weather_screens/hourly_screen.dart';

class HourlyListElement extends StatelessWidget {
  final HourlyWeatherForecast forecast;

  HourlyListElement(this.forecast);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailHourlyWeatherScreen(forecast),
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
              Text(
                forecast.timeString,
              ),
              SizedBox(height: 10),
              Text('${forecast.intTemp}°C'),
              SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context).translate('feels_like'),
                  ),
                  SizedBox(height: 3),
                  Text('${forecast.intFeelsLike}°C'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
