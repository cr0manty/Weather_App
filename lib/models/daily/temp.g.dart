// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyTemp _$DailyTempFromJson(Map<String, dynamic> json) {
  return DailyTemp(
    day: (json['day'] as num)?.toDouble() ?? 0,
    night: (json['night'] as num)?.toDouble() ?? 0,
  );
}

Map<String, dynamic> _$DailyTempToJson(DailyTemp instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
    };
