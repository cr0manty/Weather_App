import 'package:flutter/material.dart';
import 'package:weather_app/utils/image_view.dart';

class HourlyListElement extends StatelessWidget {

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
            Text(
              '23',
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
