// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressByCoordinatesResponse _$AddressByCoordinatesResponseFromJson(
    Map<String, dynamic> json) {
  return AddressByCoordinatesResponse(
    lat: json['lat'] as String,
    lon: json['lon'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddressByCoordinatesResponseToJson(
        AddressByCoordinatesResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'address': instance.address,
    };
