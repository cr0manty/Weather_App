import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/daily/forecast.dart';
import 'package:weather_app/models/hourly/forecast.dart';

part 'weather_response.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class WeatherResponse extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'lat')
  final double lat;
  @HiveField(1)
  @JsonKey(name: 'lon')
  final double lon;
  @HiveField(2)
  @JsonKey(name: 'timezone')
  final String timezone;
  @HiveField(3)
  @JsonKey(name: 'timezone_offset')
  final int timezoneOffset;
  @HiveField(4)
  @JsonKey(name: 'current')
  final HourlyWeatherForecast current;
  @HiveField(5)
  @JsonKey(name: 'hourly')
  final List<HourlyWeatherForecast> hourly;
  @HiveField(6)
  @JsonKey(name: 'daily')
  final List<DailyWeatherForecast> daily;

  WeatherResponse({
    this.current,
    this.daily,
    this.hourly,
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> data) =>
      _$WeatherResponseFromJson(data);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

  @override
  String toString() => json.encode(_$WeatherResponseToJson(this));
}
