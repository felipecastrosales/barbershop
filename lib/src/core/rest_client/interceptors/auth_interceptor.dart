import 'dart:io';

import 'package:barbershop/src/core/constants/local_storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final RequestOptions(:headers, :extra) = options;
    headers.remove(HttpHeaders.authorizationHeader);

    if (extra case {'DIO_AUTH_KEY': true}) {
      final sharedPreferences = await SharedPreferences.getInstance();
      headers.addAll({
        HttpHeaders.authorizationHeader:
            'Bearer ${sharedPreferences.getString(LocalStorageKeys.accessToken)}',
      });
    }

    handler.next(options);
  }
}
