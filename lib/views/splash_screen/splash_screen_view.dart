import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/utils/fade_route.dart';
import 'package:weather_app/views/home/home_screen_view.dart';

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
        .pushAndRemoveUntil(FadeRoute(page: HomePage()), (route) => false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bloc = BlocProvider.getBloc<WeatherBloc>();
    bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF607D8B).withOpacity(0.9),
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
