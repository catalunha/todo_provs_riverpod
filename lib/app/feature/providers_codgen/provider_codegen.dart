import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/todo_model.dart';

part 'provider_codegen.g.dart';

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

// Exemplo 4
// FutureProvider sem codgen
final testRepository3Provider = FutureProvider.autoDispose
    .family<TodoModel, String>(
        (ref, id) => ref.watch(testRepository1Provider).getById(id));
// FutureProvider com codgen
@riverpod
Future<TodoModel> testeRepository4(TesteRepository4Ref ref,
    {required String id}) {
  return ref.watch(testRepository1Provider).getById(id);
}
// Exemplo 4

// StreamProvider sem codgen
// StreamProvider com codgen
@@riverpod
Stream<int> values(ValuesRef ref) {
  return Stream.fromIterable([1,2,3]);
}