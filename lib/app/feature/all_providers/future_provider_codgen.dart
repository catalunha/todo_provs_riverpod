import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/todo_model.dart';
import 'provider_codgen.dart';

part 'future_provider_codgen.g.dart';

// Exemplo 4
// FutureProvider sem codgen
final testRepository3FutProv = FutureProvider.autoDispose
    .family<TodoModel, String>(
        (ref, id) => ref.watch(testRepository1Provider).getById(id));

// FutureProvider com codgen
@riverpod
Future<TodoModel> testeRepository4Fut(TesteRepository4FutRef ref,
    {required String id}) {
  return ref.watch(testRepository1Provider).getById(id);
}

// Exemplo 4
// FutureProvider sem codgen
final testeRepository5FutProvider = FutureProvider.autoDispose<List<TodoModel>>(
    (ref) => ref.watch(testRepository1Provider).getAll());

// FutureProvider com codgen
@riverpod
Future<List<TodoModel>> testeRepository6Fut(
  TesteRepository6FutRef ref,
) {
  return ref.watch(testRepository1Provider).getAll();
}
