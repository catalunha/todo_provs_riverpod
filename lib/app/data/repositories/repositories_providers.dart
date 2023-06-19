import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_provs_riverpod/app/data/repositories/todo_repository.dart';

import '../datasources/remote/jrs/todo_datasource_remote_jrs_providers.dart';

part 'repositories_providers.g.dart';

// final todoRepositoryProvider = Provider(
//   (ref) => TodoRepository(
//     todoDataSourceRemoteJrs: ref.read(todoDataSourceRemoteJrsProvider),
//   ),
// );

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepository(
      todoDataSourceRemoteJrs: ref.read(todoDataSourceRemoteJrsProvider));
}
