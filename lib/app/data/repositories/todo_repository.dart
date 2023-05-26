import 'package:todo_provs_riverpod/app/core/models/todo_model.dart';

import '../datasources/remote/todo_datasource.dart';

class TodoRepository {
  final TodoDataSource todoDataSource;
  TodoRepository({
    required this.todoDataSource,
  });

  Future<List<TodoModel>> getAll() => todoDataSource.getAll();
  Future<void> toggle(String id) => todoDataSource.toggle(id);
  Future<void> save(TodoModel todoModel) => todoDataSource.save(todoModel);
}
