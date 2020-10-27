import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/network/interseptors/auth_interseptor.dart';
import 'package:weather_app/network/responses/weather_response.dart';
import 'interseptors/logging_interseptor.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  static final ApiClient instance = _buildClient();
  static String _baseUrl;
  static Dio _dio;

  static ApiClient _buildClient() {
    _dio = Dio(_options);
    _dio.interceptors.add(LoggingInterceptor());
    _dio.interceptors.add(AuthInterceptor());
    return ApiClient(_dio);
  }

  static BaseOptions get _options {
    _baseUrl = 'https://api.openweathermap.org/data/2.5/';
    final options = BaseOptions();
    options.baseUrl = _baseUrl;
    return options;
  }

  factory ApiClient(Dio dio) = _ApiClient;

  @GET("onecall")
  Future<WeatherResponse> getWeather({
    @Query('lat') double lat,
    @Query('lon') double lon,
    @Query('appid') String appid,
  });
}
