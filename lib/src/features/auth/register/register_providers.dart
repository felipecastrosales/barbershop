import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/services/user_register/user_service.dart';
import 'package:barbershop/src/services/user_register/user_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_providers.g.dart';

@riverpod
UserRegisterService userRegisterService(UserRegisterServiceRef ref) =>
    UserRegisterServiceImpl(
      userRepository: ref.watch(userRepositoryProvider),
      userService: ref.watch(userLoginServiceProvider),
    );
