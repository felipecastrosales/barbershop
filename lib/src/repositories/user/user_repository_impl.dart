import 'dart:developer';
import 'dart:io';

import 'package:barbershop/src/core/exceptions/auth_exception.dart';
import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/core/rest_client/rest_client.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:barbershop/src/repositories/user/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<Either<AuthException, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final Response(:data) = await _restClient.unAuth.post(
        '/auth',
        data: {'email': email, 'password': password},
      );
      // ignore: avoid_dynamic_calls
      return Success(data['access_token']);
    } on DioException catch (e, s) {
      if (e.response != null) {
        final Response(:statusCode) = e.response!;
        if (statusCode == HttpStatus.forbidden) {
          log('Login ou senha invalido login', error: e, stackTrace: s);
          return Failure(const AuthUnauthorizedException());
        }
      }
      log('Erro ao realizar login', error: e, stackTrace: s);
      return Failure(const AuthError(message: 'Erro ao realizar login'));
    }
  }

  @override
  Future<Either<RepositoryException, UserModel>> me() async {
    try {
      final Response(:data) = await _restClient.auth.get('/me');
      return Success(UserModel.fromMap(data));
    } on DioException catch (e, s) {
      log('Erro ao buscar usuário logado', error: e, stackTrace: s);
      return Failure(
        const RepositoryException(message: 'Erro ao buscar usuário logado'),
      );
    } on ArgumentError catch (e, s) {
      log('Invalid JSON', error: e, stackTrace: s);
      return Failure(
        const RepositoryException(message: 'Invalid JSON'),
      );
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> registerAdmin(
    ({String email, String name, String password}) userData,
  ) async {
    try {
      await _restClient.unAuth.post(
        '/users',
        data: {
          'name': userData.name,
          'email': userData.password,
          'password': userData.password,
          'profile': 'ADM',
        },
      );
      return Success(nil);
    } on DioException catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      return Failure(
        const RepositoryException(
          message: 'Erro ao registrar usuário adminstrador',
        ),
      );
    }
  }
}
