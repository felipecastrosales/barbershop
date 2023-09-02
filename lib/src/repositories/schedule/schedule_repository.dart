import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/models/schedule_model.dart';

abstract interface class ScheduleRepository {
  Future<Either<RepositoryException, Nil>> scheduleClient(
    ({
      int barbershopId,
      int userId,
      String clientName,
      DateTime date,
      int time,
    }) scheduleData,
  );

  Future<Either<RepositoryException, List<ScheduleModel>>> findScheduleByDate(
    ({DateTime date, int userId}) filter,
  );
}
