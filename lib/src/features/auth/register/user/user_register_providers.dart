import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/services/user_register_adm/user_service_adm.dart';
import 'package:barbershop/src/services/user_register_adm/user_service_adm_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_register_providers.g.dart';

@riverpod
UserRegisterServiceADM userRegisterServiceADM(UserRegisterServiceADMRef ref) =>
    UserRegisterServiceADMImpl(
      userRepository: ref.watch(userRepositoryProvider),
      userService: ref.watch(userLoginServiceProvider),
    );
