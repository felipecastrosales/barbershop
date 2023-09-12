import 'package:barbershop/src/core/rest_client/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
            baseUrl: 'http://192.168.1.14:8080',
          ),
        ) {
    interceptors.addAll([
      AuthInterceptor(),
      PrettyDioLogger(),
    ]);
  }

  RestClient get auth => this..options.extra['DIO_AUTH_KEY'] = true;
  RestClient get unAuth => this..options.extra['DIO_AUTH_KEY'] = false;
}
