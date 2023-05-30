import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'provider_codgen.dart';

part 'notifier_provider_codgen.g.dart';

// novo com NotifierProvider sem codgen
class Counter3Not extends Notifier<int> {
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

final counter3NotProvider =
    NotifierProvider<Counter3Not, int>(() => Counter3Not());
final counter3aNotProvider =
    NotifierProvider<Counter3Not, int>(Counter3Not.new);

// novo com NotifierProvider com codgen
@riverpod
class Counter4Not extends _$Counter4Not {
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
