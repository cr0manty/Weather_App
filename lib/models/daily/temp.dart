import 'package:json_annotation/json_annotation.dart';

import 'feels_like.dart';

part 'temp.g.dart';

@JsonSerializable()
class DailyTemp extends DailyFeelsLike {
  @JsonKey(name: 'min', defaultValue: 0)
  final double min;
  @JsonKey(name: 'max', defaultValue: 0)
  final double max;

  const DailyTemp({
    this.min,
    this.max,
    double day,
    double night,
    double evening,
    double morning,
  }) : super(
          day: day,
          night: night,
          evening: evening,
          morning: morning,
        );

  factory DailyTemp.fromJson(Map<String, dynamic> data) =>
      _$DailyTempFromJson(data);

  Map<String, dynamic> toJson() => _$DailyTempToJson(this);
}
