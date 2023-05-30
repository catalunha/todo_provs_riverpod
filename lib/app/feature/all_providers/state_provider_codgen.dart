import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'provider_codgen.dart';

part 'state_provider_codgen.g.dart';

// Exemplo 6 - Notifier e NotifierProvider (sync)
// Aqui implemento um StateProvider como um NotifierProvider de duas formas

// antigo com StateProvider sem codgen
final counterSttProvider = StateProvider<int>((ref) => 0);

// novo com NotifierProvider sem codgen
class CounterNot extends Notifier<int> {
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

final counterNotProvider =
    NotifierProvider<CounterNot, int>(() => CounterNot());
final counterNotProvider2 = NotifierProvider<CounterNot, int>(CounterNot.new);

// novo com NotifierProvider com codgen
@riverpod
class Counter2Not extends _$Counter2Not {
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
