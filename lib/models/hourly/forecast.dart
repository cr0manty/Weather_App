import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../weather.dart';

part 'forecast.g.dart';

@JsonSerializable()
class HourlyWeatherForecast {
  @JsonKey(name: 'dt', defaultValue: 0)
  final int dt;
  @JsonKey(name: 'temp', defaultValue: 0)
  final double temp;
  @JsonKey(name: 'feels_like', defaultValue: 0)
  final double feelsLike;
  @JsonKey(name: 'pressure', defaultValue: 0)
  final int pressure;
  @JsonKey(name: 'humidity', defaultValue: 0)
  final int humidity;
  @JsonKey(name: 'dew_point', defaultValue: 0)
  final double dewPoint;
  @JsonKey(name: 'wind_speed', defaultValue: 0)
  final double windSpeed;
  @JsonKey(name: 'wind_deg', defaultValue: 0)
  final int windDeg;
  @JsonKey(name: 'weather')
  final List<WeatherForecast> weatherList;
  @JsonKey(name: 'clouds', defaultValue: 0)
  final int clouds;
  @JsonKey(name: 'pop', defaultValue: 0)
  final double pop;
  @JsonKey(name: 'uvi', defaultValue: 0)
  final double uvi;
  @JsonKey(name: 'visibility', defaultValue: 0)
  final int visibility;
  @JsonKey(name: 'rain')
  final Map<String, double> rain;
  @JsonKey(name: 'snow')
  final Map<String, double> snow;

  const HourlyWeatherForecast({
    this.pop,
    this.clouds,
    this.dewPoint,
    this.dt,
    this.feelsLike,
    this.humidity,
    this.pressure,
    this.temp,
    this.weatherList,
    this.windDeg,
    this.windSpeed,
    this.visibility,
    this.uvi,
    this.snow,
    this.rain,
  });

  factory HourlyWeatherForecast.fromJson(Map<String, dynamic> data) =>
      _$HourlyWeatherForecastFromJson(data);

  Map<String, dynamic> toJson() => _$HourlyWeatherForecastToJson(this);

  int get rainOrSnow {
    return 0;
  }

  DateTime get dateTime => DateTime.fromMillisecondsSinceEpoch(dt * 1000);

  String get dateString => DateFormat('dd MMM y').format(dateTime);

  String get timeString => DateFormat('HH:mm').format(dateTime);

  String get dateTimeString => DateFormat('dd MMM y HH:mm').format(dateTime);

  int get intTemp => temp.round();

  int get intFeelsLike => feelsLike.round();

  WeatherForecast get weather =>
      weatherList != null && weatherList.isNotEmpty ? weatherList.first : null;
}
