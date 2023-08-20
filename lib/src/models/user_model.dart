sealed class UserModel {
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
          workDays: (json['workDays'] as List<String?>?)?.cast<String>(),
          workHours: (json['workHours'] as List<int?>?)?.cast<int>(),
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
        'barbershopId': final int barbershopId,
        'workDays': final List<String> workDays,
        'workHours': final List<int> workHours,
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
