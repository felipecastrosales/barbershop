final class BarbershopModel {
  const BarbershopModel({
    required this.id,
    required this.name,
    required this.email,
    required this.openDays,
    required this.openHours,
  });

  factory BarbershopModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'email': String email,
        'opening_days': final List openDays,
        'opening_hours': final List openHours,
      } =>
        BarbershopModel(
          id: id,
          name: name,
          email: email,
          openDays: openDays.cast<String>(),
          openHours: openHours.cast<int>(),
        ),
      _ => throw ArgumentError('Invalid BarbershopModel JSON: $json'),
    };
  }

  final int id;
  final String name;
  final String email;
  final List<String> openDays;
  final List<int> openHours;
}
