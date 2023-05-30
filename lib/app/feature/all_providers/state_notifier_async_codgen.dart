import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'provider_codgen.dart';

part 'state_notifier_async_codgen.g.dart';

// Mostro como construir um StateNotifier async e substituir por um AsyncNotifier
// AsyncNotifier e AsyncNotifierProvider (async)

// usando stateNotifier async sem codgen
// a desvantagem é que o StateNotifier Async nao tem inicialização assincrona
class NumbersAsySttNot extends StateNotifier<AsyncValue<List<int>>> {
  NumbersAsySttNot(this.ref) : super(const AsyncData([0]));
  final Ref ref;
  Future<void> newNumbers() async {
    ref.read(simpleValue1Provider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => Future.value([1, 2, 3]));
  }
}

final numbersAsySttNotProvider =
    StateNotifierProvider<NumbersAsySttNot, AsyncValue<List<int>>>(
        (ref) => NumbersAsySttNot(ref));

// A vantagem é que o AsyncNotifier tem inicializaçã assincrona ou nao
// usando AsyncNotifier sem codgen
class NumbersAsyNot extends AsyncNotifier<List<int>> {
  @override
  FutureOr<List<int>> build() async {
    ref.read(simpleValue1Provider);
    return await Future.value([1, 2, 3]);
  }

  Future<void> newNumbers() async {
    ref.read(simpleValue1Provider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => Future.value([4, 5, 6]));
  }
}

//Aqui nao posso ter autoDispose para isto use nova sintaxe
final numbersAsyNotProvider =
    AsyncNotifierProvider<NumbersAsyNot, List<int>>(() => NumbersAsyNot());
final numbersAsyNotaProvider =
    AsyncNotifierProvider<NumbersAsyNot, List<int>>(NumbersAsyNot.new);

@riverpod
class Numbers2AsyNot extends _$Numbers2AsyNot {
  @override
  FutureOr<List<int>> build() async {
    ref.read(simpleValue1Provider);

    return await Future.value([1, 2, 3]);
  }

  Future<void> newNumbers() async {
    ref.read(simpleValue1Provider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => Future.value([4, 5, 6]));
  }
}
