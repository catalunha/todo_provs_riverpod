import 'package:todo_provs_riverpod/app/data/datasources/remote/jrs/todo_datasource_remote_jrs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_datasource_remote_jrs_providers.g.dart';

// final todoDataSourceRemoteJrsProvider = Provider((ref) => TodoDataSourceRemoteJrs());

@riverpod
TodoDataSourceRemoteJrs todoDataSourceRemoteJrs(
    TodoDataSourceRemoteJrsRef ref) {
  return TodoDataSourceRemoteJrs();
}
