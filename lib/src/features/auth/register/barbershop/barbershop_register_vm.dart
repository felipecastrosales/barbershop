import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/features/auth/register/barbershop/barbershop_register_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'barbershop_register_vm.g.dart';

@riverpod
class BarbershopRegisterVM extends _$BarbershopRegisterVM {
  @override
  BarbershopRegisterState build() => BarbershopRegisterState.initial();

  void addOrRemoveOpeningDays(String weekDay) {
    final openingDays = state.openingDays;
    if (openingDays.contains(weekDay)) {
      openingDays.remove(weekDay);
    } else {
      openingDays.add(weekDay);
    }
    state = state.copyWith(openingDays: openingDays);
  }

  void addOrRemoveOpeningHours(int hour) {
    final openingHours = state.openingHours;
    if (openingHours.contains(hour)) {
      openingHours.remove(hour);
    } else {
      openingHours.add(hour);
    }
    state = state.copyWith(openingHours: openingHours);
  }

  Future<void> register({
    required String name,
    required String email,
  }) async {
    final repository = ref.watch(barbershopRepositoryProvider);
    final BarbershopRegisterState(:openingDays, :openingHours) = state;

    final dto = (
      name: name,
      email: email,
      openingDays: openingDays,
      openingHours: openingHours,
    );

    final registerResult = await repository.save(dto);

    switch (registerResult) {
      case Success():
        ref.invalidate(getMyBarbershopProvider);
        state = state.copyWith(status: BarbershopRegisterStateStatus.success);
      case Failure():
        state = state.copyWith(status: BarbershopRegisterStateStatus.error);
    }
  }
}
