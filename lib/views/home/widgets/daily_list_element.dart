import 'package:flutter/material.dart';
import 'package:weather_app/utils/image_view.dart';

import 'daily_weather_time_line.dart';

class DailyListElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: ImageView(
                'http://openweathermap.org/img/wn/10d@2x.png',
                userPlaceholder: false,
              ),
            ),
            Text(
              '123/123/13',
            ),
            SizedBox(height: 10),
            Column(
              children: [
                DailyWeatherTimeLine(
                  label: '23',
                  icon: Icons.wb_sunny,
                ),
                DailyWeatherTimeLine(
                  label: '23',
                  icon: Icons.nightlight_round,
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Text('fils like,'),
                SizedBox(height: 3),
                Text('23'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
