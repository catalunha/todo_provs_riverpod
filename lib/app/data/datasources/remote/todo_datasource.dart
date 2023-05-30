import 'package:dio/dio.dart';
import 'package:todo_provs_riverpod/app/core/models/todo_model.dart';

class TodoDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: 'http://192.168.10.105:8080'));
  Future<List<TodoModel>> get() async {
    try {
      final response = await dio.get('/todos');

      if (response.data.isEmpty) {
        throw Exception('ToDos não encontrados');
      }
      return response.data
          .map<TodoModel>((e) => TodoModel.fromJson(e))
          .toList();
    } on DioError catch (e, s) {
      print('DioError em TodoDataSource get');

      print(e);
      print(s);
      // throw Exception();
      rethrow;
    } catch (e, s) {
      print('Error em TodoDataSource get');

      print(e);
      print(s);
      // throw Exception();
      rethrow;
    }
  }

  Future<TodoModel> getId(int id) async {
    try {
      final response = await dio.get('/todos/$id');

      if (response.data.isEmpty) {
        throw Exception('Estudantes não encontrados');
      }

      return TodoModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> toggle(TodoModel model) async {
    try {
      TodoModel modelTemp = model.copyWith(isCompleted: !model.isCompleted);
      dio.put('/todos/${model.id}', data: modelTemp.toJson());
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
      dio.post('/todos', data: model.toJson());
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> _put(TodoModel model) async {
    try {
      dio.put('/todos/${model.id}', data: model.toJson());
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> delete(int id) async {
    try {
      dio.delete('/todos/$id');
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}
