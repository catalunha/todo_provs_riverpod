import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'provider_codgen.dart';

part 'state_provider_codgen.g.dart';
// Exemplo 6 - Notifier e NotifierProvider (sync)

// antigo com StateProvider sem codgen
final counter1Provider = StateProvider<int>((ref) => 0);

// novo com NotifierProvider sem codgen
class Counter3 extends Notifier<int> {
  @override
  int build() {
    ref.read(simpleValue1Provider);

    return 0;
  }

  void increment() {
    ref.read(simpleValue1Provider);

    state++;
  }
}

final counter3Provider = NotifierProvider<Counter3, int>(() => Counter3());
final counter3aProvider = NotifierProvider<Counter3, int>(Counter3.new);

// novo com NotifierProvider com codgen
@riverpod
class Counter4 extends _$Counter4 {
  @override
  int build() {
    ref.read(simpleValue1Provider);

    return 0;
  }

  void increment() {
    ref.read(simpleValue1Provider);

    state++;
  }
}
