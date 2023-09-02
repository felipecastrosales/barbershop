import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/models/schedule_model.dart';
import 'package:barbershop/src/repositories/schedule/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  @override
  Future<Either<RepositoryException, List<ScheduleModel>>> findScheduleByDate(
    ({DateTime date, int userId}) filter,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<RepositoryException, Nil>> scheduleClient(
    ({
      int barbershopId,
      String clientName,
      DateTime date,
      int time,
      int userId
    }) scheduleData,
  ) async {
    throw UnimplementedError();
  }
}
