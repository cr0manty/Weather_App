// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyTemp _$DailyTempFromJson(Map<String, dynamic> json) {
  return DailyTemp(
    min: (json['min'] as num)?.toDouble() ?? 0,
    max: (json['max'] as num)?.toDouble() ?? 0,
    day: (json['day'] as num)?.toDouble() ?? 0,
    night: (json['night'] as num)?.toDouble() ?? 0,
    evening: (json['eve'] as num)?.toDouble() ?? 0,
    morning: (json['morn'] as num)?.toDouble() ?? 0,
  );
}

Map<String, dynamic> _$DailyTempToJson(DailyTemp instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.evening,
      'morn': instance.morning,
      'min': instance.min,
      'max': instance.max,
    };
