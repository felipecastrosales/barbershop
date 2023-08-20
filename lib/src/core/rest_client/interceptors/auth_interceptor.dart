import 'dart:io';

import 'package:barbershop/src/core/constants/local_storage_keys.dart';
import 'package:barbershop/src/core/ui/barbershop_nav_global_key.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    super.onError(err, handler);
    final DioException(requestOptions: RequestOptions(:extra), :response) = err;
    if (extra case {'DIO_AUTH_KEY': true}) {
      if (response != null && response.statusCode == HttpStatus.forbidden) {
        Navigator.of(
          BarbershopNavGlobalKey.instance.navKey.currentContext!,
        ).pushNamedAndRemoveUntil('/auth/login', ((route) => false));
      }
    }
    handler.reject(err);
  }
}
