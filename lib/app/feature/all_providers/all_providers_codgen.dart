
// part 'provider_codgen.g.dart';

// +++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++
// Com o Provider, FutureProvider, StreamProvider
// Usamos funcoes
// +++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++

// +++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++
// Com o Notifier e AsyncNotifier
// Usamos classes
// +++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++




/*
//Exemplo 1
// Provider sem codgen
final simpleValue1Provider = Provider<String>((ref) => 'StringTest');
// Provider com codgen
@riverpod
String simpleValue2(SimpleValue2Ref ref) {
  return 'StringTest';
}

//Exemplo 2
// Provider sem codgen
final restClient1Provider = Provider<Dio>((ref) => Dio());
// Provider com codgen
@Riverpod(keepAlive: true)
Dio restClient2(RestClient2Ref ref) {
  return Dio();
}

//Exemplo 3
class TestRepository {
  final Dio client;
  TestRepository({
    required this.client,
  });
  Future<List<TodoModel>> getAll() {
    return Future.value([]);
  }

  Future<TodoModel> getById(String id) {
    return Future.value(TodoModel(description: 'teste'));
  }
}

// Provider sem codgen
final testRepository1Provider = Provider<TestRepository>(
    (ref) => TestRepository(client: ref.watch(restClient2Provider)));
// Provider com codgen
@riverpod
TestRepository testRepository2(TestRepository2Ref ref) {
  return TestRepository(client: ref.watch(restClient2Provider));
}

// // Exemplo 4
// // FutureProvider sem codgen
// final testRepository3Provider = FutureProvider.autoDispose
//     .family<TodoModel, String>(
//         (ref, id) => ref.watch(testRepository1Provider).getById(id));
// // FutureProvider com codgen
// @riverpod
// Future<TodoModel> testeRepository4(TesteRepository4Ref ref,
//     {required String id}) {
//   return ref.watch(testRepository1Provider).getById(id);
// }

// Exemplo 5

// // StreamProvider sem codgen
// final streamValues1Provider = StreamProvider<Stream<int>>((ref) async* {
//   yield Stream.fromIterable([1, 2, 3]);
// });
// // function StreamProvider com codgen
// @riverpod
// Stream<int> streamValues2(StreamValues2Ref ref) {
//   return Stream.fromIterable([1, 2, 3]);
// }
// // class StreamProvider com codgen

// @riverpod
// class streamValues3 extends _$streamValues3 {
//   @override
//   Stream<int> build() {
//     return Stream.fromIterable([1, 2, 3]);
//   }
// }
// +++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++
// Com o Notifier e AsyncNotifier
// Usamos classes
// +++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++

// Exemplo 6 - Notifier e NotifierProvider (sync)

// antigo com StateProvider sem codgen
final counter1Provider = StateProvider<int>((ref) => 0);

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


// Exemplo 7 - AsyncNotifier e AsyncNotifierProvider (async)

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
*/