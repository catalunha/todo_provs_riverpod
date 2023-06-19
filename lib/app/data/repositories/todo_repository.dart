import 'package:todo_provs_riverpod/app/core/models/todo_model.dart';

import '../datasources/remote/jrs/todo_datasource_remote_jrs.dart';

class TodoRepository {
  final TodoDataSourceRemoteJrs todoDataSourceRemoteJrs;
  TodoRepository({
    required this.todoDataSourceRemoteJrs,
  });

  Future<List<TodoModel>> read() async {
    await Future.delayed(const Duration(seconds: 1));
    return todoDataSourceRemoteJrs.read();
  }

  Future<TodoModel> readById(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return todoDataSourceRemoteJrs.readById(id);
  }

  Future<void> toggle(TodoModel model) async {
    await Future.delayed(const Duration(seconds: 1));
    return todoDataSourceRemoteJrs.toggle(model);
  }

  Future<void> save(TodoModel model) async {
    await Future.delayed(const Duration(seconds: 1));
    return todoDataSourceRemoteJrs.save(model);
  }

  Future<void> delete(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return todoDataSourceRemoteJrs.delete(id);
  }
}
