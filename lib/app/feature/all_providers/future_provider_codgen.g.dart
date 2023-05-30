// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_provider_codgen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$testeRepository4FutHash() =>
    r'f51a646dab4d9a22a688c523441f7c709299f78f';

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

typedef TesteRepository4FutRef = AutoDisposeFutureProviderRef<TodoModel>;

/// See also [testeRepository4Fut].
@ProviderFor(testeRepository4Fut)
const testeRepository4FutProvider = TesteRepository4FutFamily();

/// See also [testeRepository4Fut].
class TesteRepository4FutFamily extends Family<AsyncValue<TodoModel>> {
  /// See also [testeRepository4Fut].
  const TesteRepository4FutFamily();

  /// See also [testeRepository4Fut].
  TesteRepository4FutProvider call({
    required String id,
  }) {
    return TesteRepository4FutProvider(
      id: id,
    );
  }

  @override
  TesteRepository4FutProvider getProviderOverride(
    covariant TesteRepository4FutProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'testeRepository4FutProvider';
}

/// See also [testeRepository4Fut].
class TesteRepository4FutProvider extends AutoDisposeFutureProvider<TodoModel> {
  /// See also [testeRepository4Fut].
  TesteRepository4FutProvider({
    required this.id,
  }) : super.internal(
          (ref) => testeRepository4Fut(
            ref,
            id: id,
          ),
          from: testeRepository4FutProvider,
          name: r'testeRepository4FutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$testeRepository4FutHash,
          dependencies: TesteRepository4FutFamily._dependencies,
          allTransitiveDependencies:
              TesteRepository4FutFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is TesteRepository4FutProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$testeRepository6FutHash() =>
    r'5d4e9a7ba8d1ce079f67ad147c10d3ec0b596b86';

/// See also [testeRepository6Fut].
@ProviderFor(testeRepository6Fut)
final testeRepository6FutProvider =
    AutoDisposeFutureProvider<List<TodoModel>>.internal(
  testeRepository6Fut,
  name: r'testeRepository6FutProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testeRepository6FutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TesteRepository6FutRef = AutoDisposeFutureProviderRef<List<TodoModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
