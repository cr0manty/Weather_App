import 'package:flutter/material.dart';
import 'package:weather_app/models/daily/forecast.dart';
import 'package:weather_app/views/home/widgets/daily_list_element.dart';

class DailyWeatherScreen extends StatelessWidget {
  final List<DailyWeatherForecast> forecasts;

  DailyWeatherScreen(this.forecasts);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                forecasts.length,
                (index) => DailyListElement(forecasts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
