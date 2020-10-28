// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyWeatherForecast _$HourlyWeatherForecastFromJson(
    Map<String, dynamic> json) {
  return HourlyWeatherForecast(
    pop: (json['pop'] as num)?.toDouble() ?? 0,
    clouds: json['clouds'] as int ?? 0,
    dewPoint: (json['dew_point'] as num)?.toDouble() ?? 0,
    dt: json['dt'] as int ?? 0,
    feelsLike: (json['feels_like'] as num)?.toDouble() ?? 0,
    humidity: json['humidity'] as int ?? 0,
    pressure: json['pressure'] as int ?? 0,
    temp: (json['temp'] as num)?.toDouble() ?? 0,
    weatherList: (json['weather'] as List)
        ?.map((e) => e == null
            ? null
            : WeatherForecast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    windDeg: json['wind_deg'] as int ?? 0,
    windSpeed: (json['wind_speed'] as num)?.toDouble() ?? 0,
    visibility: json['visibility'] as int ?? 0,
    uvi: (json['uvi'] as num)?.toDouble(),
    snow: (json['snow'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
    rain: (json['rain'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
  );
}

Map<String, dynamic> _$HourlyWeatherForecastToJson(
        HourlyWeatherForecast instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'weather': instance.weatherList,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
      'visibility': instance.visibility,
      'rain': instance.rain,
      'snow': instance.snow,
    };
