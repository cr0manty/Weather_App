import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/network/responses/weather_response.dart';
import 'package:weather_app/utils/localization.dart';
import 'package:weather_app/views/home/sections/current_section.dart';
import 'package:weather_app/views/home/sections/hourly_screen.dart';

import 'sections/daily_sceren.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<WeatherBloc>();

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
            stream: bloc.onLocationChange,
            initialData: bloc.city ??
                AppLocalizations.of(context).translate('default_city'),
            builder: (context, localeSnapshot) {
              return Center(
                child: Text(
                  localeSnapshot.data ?? '',
                ),
              );
            }),
        leading: FlatButton(
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: bloc.init,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: bloc.onTabChangeClick,
            itemBuilder: (context) {
              return bloc.choices
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
        stream: bloc.onDataUpdated,
        initialData: bloc.weatherResponse,
        builder: (context, snapshot) {
          return ListView(
            shrinkWrap: true,
            children: [
              CurrentSection(snapshot.data),
              SizedBox(height: 20),
              StreamBuilder<String>(
                stream: bloc.onTabChange,
                initialData: 'daily',
                builder: (context, localSnapshot) {
                  switch (localSnapshot.data) {
                    case 'daily':
                      return DailyWeatherScreen(snapshot.data?.daily ?? []);
                    case 'hourly':
                      return HourlyWeatherScreen(snapshot.data?.hourly ?? [], snapshot.data.timezoneOffset);
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
