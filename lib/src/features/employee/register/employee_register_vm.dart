import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/features/employee/register/employee_register_state.dart';
import 'package:barbershop/src/models/barbershop_model.dart';
import 'package:barbershop/src/repositories/user/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_register_vm.g.dart';

@riverpod
class EmployeeRegisterVM extends _$EmployeeRegisterVM {
  @override
  EmployeeRegisterState build() => EmployeeRegisterState.initial();

  void setRegisterADM(bool isRegisterADM) {
    state = state.copyWith(registerADM: isRegisterADM);
  }

  void addOrRemoveWeekDays(String weekDay) {
    final EmployeeRegisterState(:workDays) = state;

    if (workDays.contains(weekDay)) {
      workDays.remove(weekDay);
    } else {
      workDays.add(weekDay);
    }

    state = state.copyWith(workDays: workDays);
  }

  void addOrRemoveWorkHours(int workHour) {
    final EmployeeRegisterState(:workHours) = state;

    if (workHours.contains(workHour)) {
      workHours.remove(workHour);
    } else {
      workHours.add(workHour);
    }

    state = state.copyWith(workHours: workHours);
  }

  Future<void> register({
    String? name,
    String? email,
    String? password,
  }) async {
    final EmployeeRegisterState(:registerADM, :workDays, :workHours) = state;
    final asyncLoaderHandler = AsyncLoaderHandler()..start();

    final UserRepository(:registerADMAsEmployee, :registerEmployee) =
        ref.read(userRepositoryProvider);

    final Either<RepositoryException, Nil> resultRegister;

    if (registerADM) {
      final dto = (
        workDays: workDays,
        workHours: workHours,
      );
      resultRegister = await registerADMAsEmployee(dto);
    } else {
      final BarbershopModel(:id) =
          await ref.watch(getMyBarbershopProvider.future);
      final dto = (
        barbershopId: id,
        name: name!,
        email: email!,
        password: password!,
        workDays: workDays,
        workHours: workHours,
      );

      resultRegister = await registerEmployee(dto);
    }

    switch (resultRegister) {
      case Success():
        state = state.copyWith(status: EmployeeRegisterStateStatus.success);
      case Failure():
        state = state.copyWith(status: EmployeeRegisterStateStatus.error);
    }

    asyncLoaderHandler.close();
  }
}
