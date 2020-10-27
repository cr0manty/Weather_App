import 'package:flutter/material.dart';
import 'package:weather_app/views/splash_screen/splash_screen_view.dart';
import 'package:weather_app/utils/notification_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await NotificationManager.instance.configure();
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage('assets/images/logo.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: SplashScreen(),
    );
  }
}

