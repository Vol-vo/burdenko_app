import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = _initDio();

Dio _initDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://min-api.cryptocompare.com/',
    ),
  );
  dio.interceptors.add(PrettyDioLogger());

  return dio;
}