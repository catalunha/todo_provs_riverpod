import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'provider_codgen.dart';

part 'state_notifier_sync_codgen.g.dart';
// Mostro como transformar um StateNotifier num NotifierProvider

// antigo com StateNotifier sem codgen
class CounterSttNot extends StateNotifier<int> {
  CounterSttNot() : super(0);
  void increment() {
    state++;
  }
}

final counterSttNotProvider =
    StateNotifierProvider<CounterSttNot, int>((ref) => CounterSttNot());

// novo com NotifierProvider sem codgen
class Counter5Not extends Notifier<int> {
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

final counter5NotProvider =
    NotifierProvider<Counter5Not, int>(() => Counter5Not());
final counter5aNotProvider =
    NotifierProvider<Counter5Not, int>(Counter5Not.new);

// novo com NotifierProvider com codgen
@riverpod
class Counter6Not extends _$Counter6Not {
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
