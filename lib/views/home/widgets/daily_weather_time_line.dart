import 'package:flutter/material.dart';

class DailyWeatherTimeLine extends StatelessWidget {
  final IconData icon;
  final String label;

  DailyWeatherTimeLine({
    @required this.label,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
        ),
        SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
