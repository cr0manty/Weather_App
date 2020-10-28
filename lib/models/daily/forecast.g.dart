// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyWeatherForecastAdapter extends TypeAdapter<DailyWeatherForecast> {
  @override
  final int typeId = 0;

  @override
  DailyWeatherForecast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyWeatherForecast(
      pop: fields[12] as double,
      clouds: fields[11] as int,
      dewPoint: fields[7] as double,
      dt: fields[0] as int,
      feelsLike: fields[4] as DailyTemp,
      humidity: fields[6] as int,
      pressure: fields[5] as int,
      sunrise: fields[1] as int,
      sunset: fields[2] as int,
      temp: fields[3] as DailyTemp,
      uvi: fields[13] as double,
      weatherList: (fields[10] as List)?.cast<WeatherForecast>(),
      windDeg: fields[9] as int,
      windSpeed: fields[8] as double,
      rain: fields[14] as double,
      snow: fields[15] as double,
    );
  }

  @override
  void write(BinaryWriter writer, DailyWeatherForecast obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.temp)
      ..writeByte(4)
      ..write(obj.feelsLike)
      ..writeByte(5)
      ..write(obj.pressure)
      ..writeByte(6)
      ..write(obj.humidity)
      ..writeByte(7)
      ..write(obj.dewPoint)
      ..writeByte(8)
      ..write(obj.windSpeed)
      ..writeByte(9)
      ..write(obj.windDeg)
      ..writeByte(10)
      ..write(obj.weatherList)
      ..writeByte(11)
      ..write(obj.clouds)
      ..writeByte(12)
      ..write(obj.pop)
      ..writeByte(13)
      ..write(obj.uvi)
      ..writeByte(14)
      ..write(obj.rain)
      ..writeByte(15)
      ..write(obj.snow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyWeatherForecastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
        : DailyTemp.fromJson(json['feels_like'] as Map<String, dynamic>),
    humidity: json['humidity'] as int ?? 0,
    pressure: json['pressure'] as int ?? 0,
    sunrise: json['sunrise'] as int ?? 0,
    sunset: json['sunset'] as int ?? 0,
    temp: json['temp'] == null
        ? null
        : DailyTemp.fromJson(json['temp'] as Map<String, dynamic>),
    uvi: (json['uvi'] as num)?.toDouble() ?? 0,
    weatherList: (json['weather'] as List)
            ?.map((e) => e == null
                ? null
                : WeatherForecast.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        0,
    windDeg: json['wind_deg'] as int ?? 0,
    windSpeed: (json['wind_speed'] as num)?.toDouble() ?? 0,
    rain: (json['rain'] as num)?.toDouble(),
    snow: (json['snow'] as num)?.toDouble(),
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
      'weather': instance.weatherList,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
      'rain': instance.rain,
      'snow': instance.snow,
    };
