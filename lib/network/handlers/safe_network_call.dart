import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'dart:convert';

import 'package:weather_app/network/handlers/result.dart';

typedef Future<HttpResponse> ApiCall();

Future<Result<T>> safeApiCall<T>(Future futureResponse) async {
  try {
    final response = await futureResponse;
    return Result(data: response, isSuccess: true);
  } catch (e, stackTrace) {
    String errorData = '';
    if (e is DioError) {
      if (e.type == DioErrorType.RESPONSE) {
        if (e.response.data is String) {
          return Result(isSuccess: false, error: e.response.data);
        }

        if (e.response.data is List) {
          return Result(isSuccess: false, error: e.response.data[0]);
        }

        Map<String, dynamic> errorMap;
        try {
          errorMap = json.decode(e.response.data);
        } catch (_) {
          errorMap = e.response.data;
        }
        errorMap.forEach(
          (key, value) {
            if (value is String) {
              errorData += (errorData.isEmpty ? '' : '\n') + value;
            } else {
              value.forEach((fieldError) {
                errorData += (errorData.isEmpty ? '' : '\n') + fieldError;
              });
            }
          },
        );
      }
    } else {
      print('$stackTrace');
    }

    return Result(isSuccess: false, error: errorData);
  }
}
