import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/todo_model.dart';
import 'provider_codgen.dart';

part 'future_provider_codgen.g.dart';

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
