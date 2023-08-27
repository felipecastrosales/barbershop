import 'package:barbershop/src/models/user_model.dart';

enum HomeADMStateStatus { loaded, error }

class HomeADMState {
  HomeADMState({
    required this.status,
    required this.employees,
  });

  final HomeADMStateStatus status;
  final List<UserModel> employees;

  HomeADMState copyWith({
    HomeADMStateStatus? status,
    List<UserModel>? employees,
  }) =>
      HomeADMState(
        status: status ?? this.status,
        employees: employees ?? this.employees,
      );
}
