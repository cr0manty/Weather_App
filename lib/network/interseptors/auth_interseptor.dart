import 'dart:async';
import 'package:dio/dio.dart';


class AuthInterceptor extends Interceptor {
  @override
  Future<FutureOr> onRequest(RequestOptions options) async {
    options.queryParameters['appid'] = '7b5c2c883484a91a3ad0b77fc36a8435';
    return options;
  }
}