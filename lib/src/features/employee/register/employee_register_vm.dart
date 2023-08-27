import 'package:barbershop/src/features/employee/register/employee_register_state.dart';
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
}
