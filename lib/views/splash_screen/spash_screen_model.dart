import 'package:hive/hive.dart';

class SplashScreenModel {

  init() async {
    var box = await Hive.openBox('myBox');
  }
}