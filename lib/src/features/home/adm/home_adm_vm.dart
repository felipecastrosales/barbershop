import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/features/home/adm/home_adm_state.dart';
import 'package:barbershop/src/models/barbershop_model.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_adm_vm.g.dart';

@riverpod
class HomeADMVM extends _$HomeADMVM {
  @override
  Future<HomeADMState> build() async {
    final repository = ref.read(userRepositoryProvider);
    final BarbershopModel(id: barbershopId) =
        await ref.read(getMyBarbershopProvider.future);
    final me = await ref.watch(getMeProvider.future);

    final employeesResult = await repository.getEmployees(barbershopId);

    switch (employeesResult) {
      case Success(value: final employeesData):
        final employees = <UserModel>[];
        if (me case UserModelADM(workDays: _?, workHours: _?)) {
          employees.add(me);
        }
        employees.addAll(employeesData);
        return HomeADMState(
          status: HomeADMStateStatus.loaded,
          employees: employees,
        );
      case Failure():
        return HomeADMState(
          status: HomeADMStateStatus.error,
          employees: [],
        );
    }
  }

  Future<void> logout() async => ref.watch(logoutProvider.future).asyncLoader();
}
