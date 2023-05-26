import 'package:todo_provs_riverpod/app/core/models/todo_model.dart';

import '../datasources/remote/todo_datasource.dart';

class TodoRepository {
  final TodoDataSource todoDataSource;
  TodoRepository({
    required this.todoDataSource,
  });

  Future<List<TodoModel>> getAll() => todoDataSource.getAll();
  Future<TodoModel> getId(int id) => todoDataSource.getId(id);
  Future<void> toggle(TodoModel model) => todoDataSource.toggle(model);
  Future<void> save(TodoModel model) => todoDataSource.save(model);
  Future<void> delete(int id) => todoDataSource.delete(id);
}
