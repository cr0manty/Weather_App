import 'package:location/location.dart';

class HomeScreenModel {
  Location _location = Location();
  final List<String> choices = [
    'daily',
    'hourly',
  ];

  LocationData _locationData;

  LocationData get locationData => _locationData;

  HomeScreenModel() {
    initLocation();
  }

  void initLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await _location.getLocation();
  }
}
