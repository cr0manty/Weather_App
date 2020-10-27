import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/views/splash_screen/splash_screen_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 3), _onTimerEnd);
  }

  void _onTimerEnd() {
    Navigator.of(context)
        .pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => Container()), (
        route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x22222222).withOpacity(0.9),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 250,
          height: 250,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
