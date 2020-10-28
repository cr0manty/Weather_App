import 'dart:async';
import 'dart:convert';

import 'package:geocoder/geocoder.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/network/api_client.dart';
import 'package:weather_app/network/handlers/safe_network_call.dart';
import 'package:weather_app/network/responses/weather_response.dart';

class HomeScreenModel {
  final StreamController<WeatherResponse> _onDataUpdated =
      StreamController<WeatherResponse>.broadcast();
  final StreamController<String> _onLocationChange =
      StreamController<String>.broadcast();
  final StreamController<String> _onTabChange =
      StreamController<String>.broadcast();

  Location _location = Location();
  LocationData _locationData;
  final List<String> choices = [
    'daily',
    'hourly',
  ];

  LocationData get locationData => _locationData;

  Stream<WeatherResponse> get onDataUpdated => _onDataUpdated.stream;

  Stream<String> get onLocationChange => _onLocationChange.stream;

  Stream<String> get onTabChange => _onTabChange.stream;

  HomeScreenModel() {
    initLocation();
  }

  void initLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    Coordinates coordinates;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await _location.requestPermission();
    } else if (_permissionGranted == PermissionStatus.GRANTED) {
      _locationData = await _location.getLocation();
      coordinates =
          Coordinates(_locationData.latitude, _locationData.longitude);
      await _setCurrentCoordinates(coordinates);
    }
    _updateData();
  }

  Future<Coordinates> get currentCoordinates async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String coordinatesString = pref.getString('LocationsCoordinates');
    if (coordinatesString == null || coordinatesString.isEmpty) {
      return Coordinates(50.439443, 30.5060126);
    }
    List<double> coordinatesList = coordinatesString
        .split(',')
        .map((coord) => double.parse(coord))
        .toList();
    return Coordinates(coordinatesList[0], coordinatesList[1]);
  }

  Future _setCurrentCoordinates(Coordinates coordinates) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String coordinatesString =
        '${coordinates.latitude},${coordinates.longitude}';
    pref.setString('LocationsCoordinates', coordinatesString);
  }

  void _updateData() async {
    final box = await Hive.openBox('weather');
    Coordinates coordinates = await currentCoordinates;
    _updateCity(coordinates);
    // final result = await safeApiCall(ApiClient.instance
    //     .getWeather(lat: coordinates.latitude, lon: coordinates.longitude));
    final result = null;
    if (result?.isSuccess != null) {
      box.put('weather', result.data.toString());
      _onDataUpdated.add(result.data);
    } else {
      final weather = box.get('weather');
      if (weather != null) {
        WeatherResponse weatherResponse = WeatherResponse.fromJson(json.decode(weather));
        _onDataUpdated.add(weatherResponse);
      }
    }
  }

  void onTabChangeClick(String tab) {
    _onTabChange.add(tab);
  }

  void _updateCity(Coordinates coordinates) async {
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    if (addresses.length > 0) {
      _onLocationChange.add(addresses.first.locality);
    }
  }

  void dispose() {
    _onDataUpdated?.close();
    _onLocationChange?.close();
    _onTabChange?.close();
  }
}
