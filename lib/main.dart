import 'package:flutter/material.dart';
import 'package:weather_app/utils/localization.dart';
import 'package:weather_app/views/splash_screen/splash_screen_view.dart';
import 'package:weather_app/utils/notification_manager.dart';

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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage('assets/images/logo.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
