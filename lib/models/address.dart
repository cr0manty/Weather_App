import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  @JsonKey(name: 'house_number')
  final String houseNumber;
  @JsonKey(name: 'road')
  final String road;
  @JsonKey(name: 'neighbourhood')
  final String neighbourhood;
  @JsonKey(name: 'suburb')
  final String suburb;
  @JsonKey(name: 'city_district')
  final String cityDistrict;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'state')
  final String state;
  @JsonKey(name: 'postcode')
  final String postcode;
  @JsonKey(name: 'country')
  final String country;
  @JsonKey(name: 'country_code')
  final String countryCode;

  const Address({
    this.city,
    this.cityDistrict,
    this.country,
    this.countryCode,
    this.neighbourhood,
    this.houseNumber,
    this.postcode,
    this.road,
    this.state,
    this.suburb,
  });

  factory Address.fromJson(Map<String, dynamic> data) =>
      _$AddressFromJson(data);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
