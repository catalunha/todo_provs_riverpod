import 'package:dio/dio.dart';
import 'package:todo_provs_riverpod/app/core/models/todo_model.dart';

class TodoDataSource {
  Future<List<TodoModel>> getAll() async {
    try {
      final response = await Dio().get('http://localhost:8080/todos');

      if (response.data.isEmpty) {
        throw Exception('ToDos não encontrados');
      }
      return response.data.map<TodoModel>((e) => TodoModel.fromMap(e)).toList();
    } on DioError catch (e, s) {
      print(e);
      print(s);
      // throw Exception();
      rethrow;
    }
  }

  Future<TodoModel> getId(int id) async {
    try {
      final response = await Dio().get('http://localhost:8080/todos/$id');

      if (response.data.isEmpty) {
        throw Exception('Estudantes não encontrados');
      }

      return TodoModel.fromMap(response.data);
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> toggle(TodoModel model) async {
    try {
      TodoModel modelTemp = model.copyWith(isCompleted: !model.isCompleted);
      Dio().put('http://localhost:8080/todos/${model.id}',
          data: modelTemp.toMap());
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> save(TodoModel model) async {
    if (model.id == null) {
      await _post(model);
    } else {
      await _put(model);
    }
  }

  Future<void> _post(TodoModel model) async {
    try {
      Dio().post('http://localhost:8080/todos', data: model.toMap());
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> _put(TodoModel model) async {
    try {
      Dio().put('http://localhost:8080/todos/${model.id}', data: model.toMap());
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> delete(int id) async {
    try {
      Dio().delete('http://localhost:8080/todos/$id');
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}
