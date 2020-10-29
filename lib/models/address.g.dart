// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    city: json['city'] as String,
    cityDistrict: json['city_district'] as String,
    country: json['country'] as String,
    countryCode: json['country_code'] as String,
    neighbourhood: json['neighbourhood'] as String,
    houseNumber: json['house_number'] as String,
    postcode: json['postcode'] as String,
    road: json['road'] as String,
    state: json['state'] as String,
    suburb: json['suburb'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'house_number': instance.houseNumber,
      'road': instance.road,
      'neighbourhood': instance.neighbourhood,
      'suburb': instance.suburb,
      'city_district': instance.cityDistrict,
      'city': instance.city,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
      'country_code': instance.countryCode,
    };
