import 'package:json_annotation/json_annotation.dart';

part 'feels_like.g.dart';

@JsonSerializable()
class DailyFeelsLike {
  @JsonKey(name: 'day', defaultValue: 0)
  final double day;
  @JsonKey(name: 'night', defaultValue: 0)
  final double night;
  @JsonKey(name: 'eve', defaultValue: 0)
  final double evening;
  @JsonKey(name: 'morn', defaultValue: 0)
  final double morning;

  const DailyFeelsLike({
    this.day,
    this.evening,
    this.morning,
    this.night,
  });

  factory DailyFeelsLike.fromJson(Map<String, dynamic> data) =>
      _$DailyFeelsLikeFromJson(data);

  Map<String, dynamic> toJson() => _$DailyFeelsLikeToJson(this);
}
