import 'package:flutter/material.dart';
import 'package:weather_app/models/hourly/forecast.dart';
import 'package:weather_app/views/home/widgets/hourly_list_element.dart';

class HourlyWeatherScreen extends StatelessWidget {
  final List<HourlyWeatherForecast> forecasts;

  HourlyWeatherScreen(this.forecasts);

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
                    (index) => HourlyListElement(forecasts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
