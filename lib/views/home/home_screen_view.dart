import 'package:flutter/material.dart';
import 'package:weather_app/network/responses/weather_response.dart';
import 'package:weather_app/utils/localization.dart';
import 'package:weather_app/views/home/sections/current_section.dart';
import 'package:weather_app/views/home/sections/hourly_screen.dart';

import 'sections/daily_sceren.dart';
import 'home_screen_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeScreenModel _model = HomeScreenModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
            stream: _model.onLocationChange,
            initialData: AppLocalizations.of(context).translate('default_city'),
            builder: (context, snapshot) {
              return Text(snapshot.data);
            }),
        actions: [
          PopupMenuButton<String>(
            onSelected: _model.onTabChangeClick,
            itemBuilder: (context) {
              return _model.choices
                  .map(
                    (String choice) => PopupMenuItem<String>(
                      child: Text(
                        AppLocalizations.of(context).translate(choice),
                      ),
                      value: choice,
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: StreamBuilder<WeatherResponse>(
        stream: _model.onDataUpdated,
        builder: (context, snapshot) {
          return ListView(
            shrinkWrap: true,
            children: [
              CurrentSection(snapshot.data),
              SizedBox(height: 20),
              StreamBuilder<String>(
                stream: _model.onTabChange,
                initialData: 'daily',
                builder: (context, localSnapshot) {
                  switch (localSnapshot.data) {
                    case 'daily':
                      return DailyWeatherScreen(snapshot.data?.daily ?? []);
                    case 'hourly':
                      return HourlyWeatherScreen(snapshot.data?.hourly ?? []);
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
