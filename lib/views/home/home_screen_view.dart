import 'package:flutter/material.dart';
import 'package:weather_app/utils/localization.dart';
import 'package:weather_app/views/home/widgets/addition_stat.dart';

import 'sections/daily_sceren.dart';
import 'home_screen_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeScreenModel _model = HomeScreenModel();

  void _onDropDownSelect(String choice) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x22222222).withOpacity(0.9),
      appBar: AppBar(
        title: Text(
          'Kiev',
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: _onDropDownSelect,
            itemBuilder: (context) {
              return _model.choices
                  .map(
                    (String choice) => PopupMenuItem<String>(
                      child: Text(
                        AppLocalizations.of(context).translate(choice),
                      ),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 8),
            alignment: Alignment.center,
            child: Text(
              'kiev',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              '23/23/23',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 40),
          Align(
            alignment: Alignment.center,
            child: Text(
              '25',
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
                '23',
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
                  label: AppLocalizations.of(context).translate('humidity'),
                  value: 'ads',
                ),
                SizedBox(width: 30),
                AdditionWeatherStat(
                  label: AppLocalizations.of(context).translate('rain/snow'),
                  value: 'ads',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          DailyWeatherScreen()
        ],
      ),
    );
  }
}
