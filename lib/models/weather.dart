import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherForecast {
  @JsonKey(name: 'id')
  final double id;
  @JsonKey(name: 'main')
  final String main;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'icon')
  final String icon;

  const WeatherForecast({
    this.description,
    this.icon,
    this.id,
    this.main,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> data) =>
      _$WeatherForecastFromJson(data);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);

  String get iconUrl => 'http://openweathermap.org/img/wn/$icon@2x.png';
}
