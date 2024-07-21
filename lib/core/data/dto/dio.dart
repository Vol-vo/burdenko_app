import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = _initDio();

Dio _initDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://94.198.217.85:8080/',
    ),
  );
  dio.interceptors.add(PrettyDioLogger());

  return dio;
}