import 'package:flutter/material.dart';

class AdditionWeatherStat extends StatelessWidget {
  final String label;
  final String value;

  AdditionWeatherStat({
    @required this.label,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
