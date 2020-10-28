import 'package:json_annotation/json_annotation.dart';

part 'temp.g.dart';

@JsonSerializable()
class DailyTemp {
  @JsonKey(name: 'day', defaultValue: 0)
  final double day;
  @JsonKey(name: 'night', defaultValue: 0)
  final double night;

  const DailyTemp({
    this.day,
    this.night,
  });

  factory DailyTemp.fromJson(Map<String, dynamic> data) =>
      _$DailyTempFromJson(data);

  Map<String, dynamic> toJson() => _$DailyTempToJson(this);

  int get dayInt => day.round();

  int get nightInt => night.round();
}
