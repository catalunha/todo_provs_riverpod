import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'provider_codgen.dart';

part 'state_notifier_sync_codgen.g.dart';

// antigo com StateNotifier sem codgen
class Counter2 extends StateNotifier<int> {
  Counter2() : super(0);
  void increment() {
    state++;
  }
}

final counter2Provider =
    StateNotifierProvider<Counter2, int>((ref) => Counter2());

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
