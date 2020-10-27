// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeatherForecast _$DailyWeatherForecastFromJson(Map<String, dynamic> json) {
  return DailyWeatherForecast(
    pop: (json['pop'] as num)?.toDouble() ?? 0,
    clouds: json['clouds'] as int ?? 0,
    dewPoint: (json['dew_point'] as num)?.toDouble() ?? 0,
    dt: json['dt'] as int ?? 0,
    feelsLike: json['feels_like'] == null
        ? null
        : DailyFeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
    humidity: json['humidity'] as int ?? 0,
    pressure: json['pressure'] as int ?? 0,
    sunrise: json['sunrise'] as int ?? 0,
    sunset: json['sunset'] as int ?? 0,
    temp: json['temp'] == null
        ? null
        : DailyTemp.fromJson(json['temp'] as Map<String, dynamic>),
    uvi: (json['uvi'] as num)?.toDouble() ?? 0,
    weather: (json['weather'] as List)
            ?.map((e) => e == null
                ? null
                : WeatherForecast.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        0,
    windDeg: json['wind_deg'] as int ?? 0,
    windSpeed: (json['wind_speed'] as num)?.toDouble() ?? 0,
  );
}

Map<String, dynamic> _$DailyWeatherForecastToJson(
        DailyWeatherForecast instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
    };
