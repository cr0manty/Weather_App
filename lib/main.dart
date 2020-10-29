import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_app/utils/hive_helper.dart';
import 'package:weather_app/utils/localization.dart';
import 'package:weather_app/views/splash_screen/splash_screen_view.dart';
import 'package:weather_app/utils/notification_manager.dart';

import 'controllers/weather_controller.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  void initState() {
    super.initState();
    NotificationManager.instance.configure();
    HiveHelper.init();
    Location().requestPermission();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage('assets/images/logo.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => WeatherBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
        localeListResolutionCallback: (locales, supportedLocales) {
          Locale currentLocale;
          for (Locale locale in locales) {
            for (Locale supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode) {
                currentLocale = supportedLocale;
                break;
              }
            }
          }
          currentLocale ??= supportedLocales.first;
          print('Device language code: ${currentLocale.languageCode}');
          print('Device country code: ${currentLocale.countryCode}');
          return currentLocale;
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
