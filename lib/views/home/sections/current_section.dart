import 'package:flutter/material.dart';
import 'package:weather_app/network/responses/weather_response.dart';
import 'package:weather_app/utils/localization.dart';
import 'package:weather_app/views/home/widgets/addition_stat.dart';

class CurrentSection extends StatelessWidget {
  final WeatherResponse weather;

  CurrentSection(this.weather);
  
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 8),
        alignment: Alignment.center,
        child: Text(
          '${weather?.current?.dateString ?? '--'}',
          style: TextStyle(fontSize: 20),
        ),
      ),
      SizedBox(height: 40),
      Align(
        alignment: Alignment.center,
        child: Text(
          '${weather?.current?.intTemp ?? '--'}°C',
          style: TextStyle(fontSize: 80),
        ),
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context).translate('feels_like'),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(width: 10),
          Text(
            '${weather?.current?.intFeelsLike ?? '--'}°C',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdditionWeatherStat(
              label:
              AppLocalizations.of(context).translate('humidity'),
              value: '${weather?.current?.humidity ?? 0}%',
            ),
            SizedBox(width: 30),
            AdditionWeatherStat(
              label:
              AppLocalizations.of(context).translate('rain/snow'),
              value: '${weather?.current?.rainOrSnow ?? 0}%',
            ),
          ],
        ),
      ),
    ],);
  }
}
