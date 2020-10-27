import 'package:flutter/material.dart';
import 'package:weather_app/views/home/widgets/daily_list_element.dart';

class DailyWeatherScreen extends StatelessWidget {
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
                10,
                (index) => DailyListElement(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
