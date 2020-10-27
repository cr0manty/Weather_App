import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/daily/feels_like.dart';
import 'package:weather_app/models/daily/temp.dart';

import '../weather.dart';

part 'forecast.g.dart';

@JsonSerializable()
class DailyWeatherForecast {
  @JsonKey(name: 'dt', defaultValue: 0)
  final int dt;
  @JsonKey(name: 'sunrise', defaultValue: 0)
  final int sunrise;
  @JsonKey(name: 'sunset', defaultValue: 0)
  final int sunset;
  @JsonKey(name: 'temp')
  final DailyTemp temp;
  @JsonKey(name: 'feels_like')
  final DailyFeelsLike feelsLike;
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
  @JsonKey(name: 'weather', defaultValue: 0)
  final List<WeatherForecast> weatherList;
  @JsonKey(name: 'clouds', defaultValue: 0)
  final int clouds;
  @JsonKey(name: 'pop', defaultValue: 0)
  final double pop;
  @JsonKey(name: 'uvi', defaultValue: 0)
  final double uvi;
   @JsonKey(name: 'rain')
  final double rain;
    @JsonKey(name: 'snow')
  final double snow;

  const DailyWeatherForecast({
    this.pop,
    this.clouds,
    this.dewPoint,
    this.dt,
    this.feelsLike,
    this.humidity,
    this.pressure,
    this.sunrise,
    this.sunset,
    this.temp,
    this.uvi,
    this.weatherList,
    this.windDeg,
    this.windSpeed,
    this.rain,
    this.snow,
  });

  factory DailyWeatherForecast.fromJson(Map<String, dynamic> data) =>
      _$DailyWeatherForecastFromJson(data);

  Map<String, dynamic> toJson() => _$DailyWeatherForecastToJson(this);

  WeatherForecast get weather =>
      weatherList != null && weatherList.isNotEmpty ? weatherList.first : null;

  double get rainOrSnow => rain ?? snow ?? 0;
}
