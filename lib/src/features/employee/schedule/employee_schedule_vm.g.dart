// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_schedule_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$employeeScheduleVMHash() =>
    r'fcd4fb19f0b66eb54b6763dd5acac6418cf1a08a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$EmployeeScheduleVM
    extends BuildlessAutoDisposeAsyncNotifier<List<ScheduleModel>> {
  late final int userId;
  late final DateTime date;

  Future<List<ScheduleModel>> build(
    int userId,
    DateTime date,
  );
}

/// See also [EmployeeScheduleVM].
@ProviderFor(EmployeeScheduleVM)
const employeeScheduleVMProvider = EmployeeScheduleVMFamily();

/// See also [EmployeeScheduleVM].
class EmployeeScheduleVMFamily extends Family<AsyncValue<List<ScheduleModel>>> {
  /// See also [EmployeeScheduleVM].
  const EmployeeScheduleVMFamily();

  /// See also [EmployeeScheduleVM].
  EmployeeScheduleVMProvider call(
    int userId,
    DateTime date,
  ) {
    return EmployeeScheduleVMProvider(
      userId,
      date,
    );
  }

  @override
  EmployeeScheduleVMProvider getProviderOverride(
    covariant EmployeeScheduleVMProvider provider,
  ) {
    return call(
      provider.userId,
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'employeeScheduleVMProvider';
}

/// See also [EmployeeScheduleVM].
class EmployeeScheduleVMProvider extends AutoDisposeAsyncNotifierProviderImpl<
    EmployeeScheduleVM, List<ScheduleModel>> {
  /// See also [EmployeeScheduleVM].
  EmployeeScheduleVMProvider(
    this.userId,
    this.date,
  ) : super.internal(
          () => EmployeeScheduleVM()
            ..userId = userId
            ..date = date,
          from: employeeScheduleVMProvider,
          name: r'employeeScheduleVMProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$employeeScheduleVMHash,
          dependencies: EmployeeScheduleVMFamily._dependencies,
          allTransitiveDependencies:
              EmployeeScheduleVMFamily._allTransitiveDependencies,
        );

  final int userId;
  final DateTime date;

  @override
  bool operator ==(Object other) {
    return other is EmployeeScheduleVMProvider &&
        other.userId == userId &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<ScheduleModel>> runNotifierBuild(
    covariant EmployeeScheduleVM notifier,
  ) {
    return notifier.build(
      userId,
      date,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
