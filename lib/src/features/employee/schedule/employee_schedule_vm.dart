import 'package:barbershop/src/models/schedule_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_schedule_vm.g.dart';

@riverpod
class EmployeeScheduleVM extends _$EmployeeScheduleVM {
  @override
  Future<List<ScheduleModel>> build(int userId, DateTime date) async {
    return [];
  }

  Future<void> changeDate(int userId, DateTime date) async {}
}
