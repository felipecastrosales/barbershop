import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/exceptions/service_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/features/auth/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVM extends _$LoginVM {
  @override
  LoginState build() => const LoginState.initial();

  Future<void> login(String email, String password) async {
    final loaderHandler = AsyncLoaderHandler()..start();
    final loginService = ref.watch(userLoginServiceProvider);

    final result = await loginService.execute(
      email: email,
      password: password,
    );

    switch (result) {
      case Success():
        break;
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: () => message,
        );
    }

    loaderHandler.close();
  }
}
