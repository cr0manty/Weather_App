import 'package:flutter/material.dart';
import 'package:weather_app/utils/localization.dart';

class RowWeatherElement extends StatelessWidget {
  final String labelKey;
  final Widget value;
  final Widget additionElement;

  RowWeatherElement(
      {@required this.value, @required this.labelKey, this.additionElement});

  Widget buildValue() {
    if (additionElement == null) {
      return value;
    }

    return Row(
      children: [
        value,
        SizedBox(width: 10),
        additionElement,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context).translate(labelKey ?? '')),
          buildValue(),
        ],
      ),
    );
  }
}
