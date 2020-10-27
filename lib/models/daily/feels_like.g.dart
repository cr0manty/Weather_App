// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feels_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyFeelsLike _$DailyFeelsLikeFromJson(Map<String, dynamic> json) {
  return DailyFeelsLike(
    day: (json['day'] as num)?.toDouble() ?? 0,
    evening: (json['eve'] as num)?.toDouble() ?? 0,
    morning: (json['morn'] as num)?.toDouble() ?? 0,
    night: (json['night'] as num)?.toDouble() ?? 0,
  );
}

Map<String, dynamic> _$DailyFeelsLikeToJson(DailyFeelsLike instance) =>
    <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.evening,
      'morn': instance.morning,
    };
