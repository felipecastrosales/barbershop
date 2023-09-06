import 'package:barbershop/src/core/constants/local_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barbershop/src/core/exceptions/auth_exception.dart';
import 'package:barbershop/src/core/exceptions/service_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/repositories/user/user_repository.dart';
import 'package:barbershop/src/services/user_login/user_login_service.dart';

final class UserLoginServiceImpl implements UserLoginService {
  UserLoginServiceImpl({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<Either<ServiceException, Nil>> execute({
    required String email,
    required String password,
  }) async {
    final result = await _userRepository.login(
      email: email,
      password: password,
    );
    switch (result) {
      case Success(:final value):
        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString(LocalStorageKeys.accessToken, value);
        return Success(nil);
      case Failure(:final exception):
        return switch (exception) {
          AuthError() =>
            Failure(const ServiceException(message: 'Erro ao realizar login')),
          AuthUnauthorizedException() => Failure(
              const ServiceException(message: 'Login ou senha inválidos'),
            ),
        };
    }
  }
}
