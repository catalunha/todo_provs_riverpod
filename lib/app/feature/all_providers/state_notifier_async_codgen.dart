import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'provider_codgen.dart';

part 'state_notifier_async_codgen.g.dart';

// AsyncNotifier e AsyncNotifierProvider (async)

// usando stateNotifier async sem codgen
class AsyncNumbers extends StateNotifier<AsyncValue<List<int>>> {
  AsyncNumbers(this.ref) : super(const AsyncData([0]));
  final Ref ref;
  Future<void> numbers() async {
    ref.read(simpleValue1Provider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => Future.value([1, 2, 3]));
  }
}

final asyncNumbersProvider =
    StateNotifierProvider<AsyncNumbers, AsyncValue<List<int>>>(
        (ref) => AsyncNumbers(ref));

// usando AsyncNotifier sem codgen
class AsyncNumbers2 extends AsyncNotifier<List<int>> {
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
final asyncNumbers2Provider =
    AsyncNotifierProvider<AsyncNumbers2, List<int>>(() => AsyncNumbers2());
final asyncNumbers2aProvider =
    AsyncNotifierProvider<AsyncNumbers2, List<int>>(AsyncNumbers2.new);

@riverpod
class AsyncNumbers3 extends _$AsyncNumbers3 {
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
