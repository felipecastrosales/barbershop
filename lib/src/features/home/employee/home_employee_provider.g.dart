// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_employee_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTotalSchedulesTodayHash() =>
    r'ec991558c2daf303a25cafc26b1006c9065cae31';

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

typedef GetTotalSchedulesTodayRef = AutoDisposeFutureProviderRef<int>;

/// See also [getTotalSchedulesToday].
@ProviderFor(getTotalSchedulesToday)
const getTotalSchedulesTodayProvider = GetTotalSchedulesTodayFamily();

/// See also [getTotalSchedulesToday].
class GetTotalSchedulesTodayFamily extends Family<AsyncValue<int>> {
  /// See also [getTotalSchedulesToday].
  const GetTotalSchedulesTodayFamily();

  /// See also [getTotalSchedulesToday].
  GetTotalSchedulesTodayProvider call(
    int userId,
  ) {
    return GetTotalSchedulesTodayProvider(
      userId,
    );
  }

  @override
  GetTotalSchedulesTodayProvider getProviderOverride(
    covariant GetTotalSchedulesTodayProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'getTotalSchedulesTodayProvider';
}

/// See also [getTotalSchedulesToday].
class GetTotalSchedulesTodayProvider extends AutoDisposeFutureProvider<int> {
  /// See also [getTotalSchedulesToday].
  GetTotalSchedulesTodayProvider(
    this.userId,
  ) : super.internal(
          (ref) => getTotalSchedulesToday(
            ref,
            userId,
          ),
          from: getTotalSchedulesTodayProvider,
          name: r'getTotalSchedulesTodayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTotalSchedulesTodayHash,
          dependencies: GetTotalSchedulesTodayFamily._dependencies,
          allTransitiveDependencies:
              GetTotalSchedulesTodayFamily._allTransitiveDependencies,
        );

  final int userId;

  @override
  bool operator ==(Object other) {
    return other is GetTotalSchedulesTodayProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
