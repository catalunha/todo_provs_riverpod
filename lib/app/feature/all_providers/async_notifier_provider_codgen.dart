import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'provider_codgen.dart';

part 'async_notifier_provider_codgen.g.dart';

// usando AsyncNotifier sem codgen
class Numbers3AsyNot extends AsyncNotifier<List<int>> {
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
final numbers3AsyNotProvider =
    AsyncNotifierProvider<Numbers3AsyNot, List<int>>(() => Numbers3AsyNot());
final numbers3aAsyNotProvider =
    AsyncNotifierProvider<Numbers3AsyNot, List<int>>(Numbers3AsyNot.new);

// usando AsyncNotifier com codgen
@riverpod
class Numbers4AsyNot extends _$Numbers4AsyNot {
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
