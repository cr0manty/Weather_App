import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/address.dart';

part 'city_reponse.g.dart';

@JsonSerializable()
class AddressByCoordinatesResponse {
  @JsonKey(name: 'lat')
  final String lat;
  @JsonKey(name: 'lon')
  final String lon;
  @JsonKey(name: 'address')
  final Address address;

  const AddressByCoordinatesResponse({
    this.lat,
    this.lon,
    this.address,
  });

  factory AddressByCoordinatesResponse.fromJson(Map<String, dynamic> data) =>
      _$AddressByCoordinatesResponseFromJson(data);

  Map<String, dynamic> toJson() => _$AddressByCoordinatesResponseToJson(this);
}
