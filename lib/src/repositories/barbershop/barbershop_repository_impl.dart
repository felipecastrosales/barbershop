import 'dart:developer';

import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/core/rest_client/rest_client.dart';
import 'package:barbershop/src/models/barbershop_model.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:barbershop/src/repositories/barbershop/barbershop_repository.dart';
import 'package:dio/dio.dart';

class BarbershopRepositoryImpl implements BarbershopRepository {
  BarbershopRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<Either<RepositoryException, BarbershopModel>> getMyBarbershop(
    UserModel userModel,
  ) async {
    switch (userModel) {
      case UserModelADM():
        final Response(data: List(first: data)) = await _restClient.auth.get(
          '/barbershop',
          queryParameters: {'user_id': '#userAuthRef'},
        );
        return Success(BarbershopModel.fromMap(data));
      case UserModelEmployee():
        final Response(:data) = await _restClient.auth.get(
          '/barbershop/${userModel.barbershopId}',
        );
        return Success(BarbershopModel.fromMap(data));
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> save(
    ({
      String email,
      String name,
      List<String> openingDays,
      List<int> openingHours,
    }) data,
  ) async {
    try {
      await _restClient.auth.post(
        '/barbershop',
        data: {
          'user_id': '#userAuthRef',
          'name': data.name,
          'email': data.email,
          'opening_days': data.openingDays,
          'opening_hours': data.openingHours,
        },
      );
      return Success(nil);
    } on DioException catch (e, s) {
      const errorMessage = 'Erro ao salvar barbearia';
      log(errorMessage, error: e, stackTrace: s);
      return Failure(const RepositoryException(message: errorMessage));
    }
  }
}
