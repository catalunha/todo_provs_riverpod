// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_provider_codgen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$testeRepository4Hash() => r'b5b4d91cbf1871237947a1c07a0e6d67c3c15d0a';

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

typedef TesteRepository4Ref = AutoDisposeFutureProviderRef<TodoModel>;

/// See also [testeRepository4].
@ProviderFor(testeRepository4)
const testeRepository4Provider = TesteRepository4Family();

/// See also [testeRepository4].
class TesteRepository4Family extends Family<AsyncValue<TodoModel>> {
  /// See also [testeRepository4].
  const TesteRepository4Family();

  /// See also [testeRepository4].
  TesteRepository4Provider call({
    required String id,
  }) {
    return TesteRepository4Provider(
      id: id,
    );
  }

  @override
  TesteRepository4Provider getProviderOverride(
    covariant TesteRepository4Provider provider,
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
  String? get name => r'testeRepository4Provider';
}

/// See also [testeRepository4].
class TesteRepository4Provider extends AutoDisposeFutureProvider<TodoModel> {
  /// See also [testeRepository4].
  TesteRepository4Provider({
    required this.id,
  }) : super.internal(
          (ref) => testeRepository4(
            ref,
            id: id,
          ),
          from: testeRepository4Provider,
          name: r'testeRepository4Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$testeRepository4Hash,
          dependencies: TesteRepository4Family._dependencies,
          allTransitiveDependencies:
              TesteRepository4Family._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is TesteRepository4Provider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
