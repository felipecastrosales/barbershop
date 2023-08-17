import 'package:barbershop/src/core/exceptions/auth_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';

abstract interface class UserRepository {
  Future<Either<AuthException, String>> login({
    required String email,
    required String password,
  });
}
