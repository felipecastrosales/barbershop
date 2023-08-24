import 'package:barbershop/src/features/auth/register/barbershop/barbershop_register_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'barbershop_register_vm.g.dart';

@riverpod
class BarbershopRegisterVM extends _$BarbershopRegisterVM {
  @override
  BarbershopRegisterState build() => BarbershopRegisterState.initial();
}
