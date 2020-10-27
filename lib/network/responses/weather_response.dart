import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/daily/forecast.dart';
import 'package:weather_app/models/hourly/forecast.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  @JsonKey(name: 'lat')
  final double lat;
  @JsonKey(name: 'lon')
  final double lon;
  @JsonKey(name: 'timezone')
  final String timezone;
  @JsonKey(name: 'timezone_offset')
  final int timezoneOffset;
  @JsonKey(name: 'current')
  final HourlyWeatherForecast current;
  @JsonKey(name: 'hourly')
  final List<HourlyWeatherForecast> hourly;
  @JsonKey(name: 'daily')
  final List<DailyWeatherForecast> daily;

  const WeatherResponse({
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
}
