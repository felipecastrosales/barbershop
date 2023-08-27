import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:barbershop/src/features/home/adm/home_adm_state.dart';

part 'home_adm_vm.g.dart';

@riverpod
class HomeADMVM extends _$HomeADMVM {
  @override
  Future<HomeADMState> build() async {
    // final repository = ref.read(userRepositoryProvider);
    // final me = await ref.watch(getMeProvider.future);

    return HomeADMState(
      status: HomeADMStateStatus.loaded,
      employees: [],
    );
  }

  Future<void> logout() async => ref.watch(logoutProvider.future).asyncLoader();
}
