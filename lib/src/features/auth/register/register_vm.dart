import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/features/auth/register/register_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_vm.g.dart';

enum RegisterStateStatus { initial, success, error }

@riverpod
class RegisterVM extends _$RegisterVM {
  @override
  RegisterStateStatus build() => RegisterStateStatus.initial;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final registerService = ref.watch(userRegisterServiceProvider);

    final userData = (
      name: name,
      email: email,
      password: password,
    );

    final result = await registerService.execute(userData).asyncLoader();

    switch (result) {
      case Success():
        ref.invalidate(getMeProvider);
        state = RegisterStateStatus.success;
      case Failure():
        state = RegisterStateStatus.error;
    }
  }
}
