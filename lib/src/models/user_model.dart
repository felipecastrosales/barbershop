sealed class UserModel {
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return switch (json['profile']) {
      'ADM' => UserModelADM.fromMap(json),
      'EMPLOYEE' => UserModelEmployee.fromMap(json),
      _ => throw ArgumentError('User profile not found'),
    };
  }

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  final int id;
  final String name, email;
  final String? avatar;
}

final class UserModelADM extends UserModel {
  factory UserModelADM.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
      } =>
        UserModelADM(
          id: id,
          name: name,
          email: email,
          avatar: json['avatar'] as String?,
          workDays: (json['work_days'] as List<String?>?)?.cast<String>(),
          workHours: (json['work_hours'] as List<int?>?)?.cast<int>(),
        ),
      _ => throw FormatException('Invalid UserModelAdm JSON: $json'),
    };
  }

  UserModelADM({
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
    this.workDays,
    this.workHours,
  });

  final List<String>? workDays;
  final List<int>? workHours;
}

class UserModelEmployee extends UserModel {
  factory UserModelEmployee.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
        'barbershop_id': final int barbershopId,
        'work_days': final List<String> workDays,
        'work_hours': final List<int> workHours,
      } =>
        UserModelEmployee(
          id: id,
          name: name,
          email: email,
          workDays: workDays,
          workHours: workHours,
          barbershopId: barbershopId,
        ),
      _ => throw FormatException('Invalid UserModelEmployee JSON: $json'),
    };
  }

  UserModelEmployee({
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
    required this.workDays,
    required this.workHours,
    required this.barbershopId,
  });

  final List<String> workDays;
  final List<int> workHours;
  final int barbershopId;
}
