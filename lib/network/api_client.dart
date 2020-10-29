import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/network/interseptors/auth_interseptor.dart';
import 'package:weather_app/network/responses/city_reponse.dart';
import 'package:weather_app/network/responses/weather_response.dart';
import 'interseptors/logging_interseptor.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  static final ApiClient weatherApi = _buildWeatherClient();
  static final ApiClient cityApi = _buildCityClient();
  static String _baseUrl;
  static Dio _dio;

  static ApiClient _buildWeatherClient() {
    _dio = Dio(_options());
    _dio.interceptors.add(LoggingInterceptor());
    _dio.interceptors.add(AuthInterceptor());
    return ApiClient(_dio);
  }

  static ApiClient _buildCityClient() {
    _dio = Dio(_options(cityApi: true));
    _dio.interceptors.add(LoggingInterceptor());
    return ApiClient(_dio);
  }

  static BaseOptions _options({bool cityApi = false}) {
    if (cityApi) {
      _baseUrl = 'https://nominatim.openstreetmap.org/';
    } else {
      _baseUrl = 'https://api.openweathermap.org/data/2.5/';
    }
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
    @Query('units') String units = 'metric',
  });

  @GET("reverse")
  Future<AddressByCoordinatesResponse> getAddressByCoordinates({
    @Query('lat') double lat,
    @Query('lon') double lon,
    @Query('format') String format = 'json',
  });
}
