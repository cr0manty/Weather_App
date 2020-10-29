// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherResponseAdapter extends TypeAdapter<WeatherResponse> {
  @override
  final int typeId = 0;

  @override
  WeatherResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherResponse(
      current: fields[4] as HourlyWeatherForecast,
      daily: (fields[6] as List)?.cast<DailyWeatherForecast>(),
      hourly: (fields[5] as List)?.cast<HourlyWeatherForecast>(),
      lat: fields[0] as double,
      lon: fields[1] as double,
      timezone: fields[2] as String,
      timezoneOffset: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherResponse obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon)
      ..writeByte(2)
      ..write(obj.timezone)
      ..writeByte(3)
      ..write(obj.timezoneOffset)
      ..writeByte(4)
      ..write(obj.current)
      ..writeByte(5)
      ..write(obj.hourly)
      ..writeByte(6)
      ..write(obj.daily);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
    current: json['current'] == null
        ? null
        : HourlyWeatherForecast.fromJson(
            json['current'] as Map<String, dynamic>),
    daily: (json['daily'] as List)
        ?.map((e) => e == null
            ? null
            : DailyWeatherForecast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hourly: (json['hourly'] as List)
        ?.map((e) => e == null
            ? null
            : HourlyWeatherForecast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
    timezone: json['timezone'] as String,
    timezoneOffset: json['timezone_offset'] as int,
  );
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'current': instance.current,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
