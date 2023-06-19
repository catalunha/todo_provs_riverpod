import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:todo_provs_riverpod/app/core/models/todo_model.dart';

class TodoDataSourceRemoteJrs {
  Dio dio = Dio(BaseOptions(baseUrl: 'http://192.168.10.105:8080'));

  Future<List<TodoModel>> read() async {
    try {
      final response = await dio.get('/todos');

      if (response.data.isEmpty) {
        throw Exception('ToDos não encontrados');
      }
      return response.data
          .map<TodoModel>((e) => TodoModel.fromJson(e))
          .toList();
    } on DioError catch (e, s) {
      log('DioError em TodoDataSourceRemoteJrs read');
      log('$e');
      log('$s');
      rethrow;
    } catch (e, s) {
      log('Error em TodoDataSourceRemoteJrs read');
      log('$e');
      log('$s');
      rethrow;
    }
  }

  Future<TodoModel> readById(int id) async {
    try {
      final response = await dio.get('/todos/$id');

      if (response.data.isEmpty) {
        throw Exception('Estudantes não encontrados');
      }

      return TodoModel.fromJson(response.data);
    } on DioError catch (e, s) {
      log('DioError em TodoDataSourceRemoteJrs readById');
      log('$e');
      log('$s');
      rethrow;
    } catch (e, s) {
      log('Error em TodoDataSourceRemoteJrs readById');
      log('$e');
      log('$s');
      rethrow;
    }
  }

  Future<void> toggle(TodoModel model) async {
    try {
      TodoModel modelTemp = model.copyWith(isCompleted: !model.isCompleted);
      await _update(modelTemp);
    } on DioError catch (e, s) {
      log('DioError em TodoDataSourceRemoteJrs toggle');
      log('$e');
      log('$s');
      rethrow;
    } catch (e, s) {
      log('Error em TodoDataSourceRemoteJrs toggle');
      log('$e');
      log('$s');
      rethrow;
    }
  }

  Future<void> save(TodoModel model) async {
    if (model.id == null) {
      await _create(model);
    } else {
      await _update(model);
    }
  }

  Future<void> _create(TodoModel model) async {
    try {
      dio.post('/todos', data: model.toJson());
    } on DioError catch (e, s) {
      log('DioError em TodoDataSourceRemoteJrs _create');
      log('$e');
      log('$s');
      rethrow;
    } catch (e, s) {
      log('Error em TodoDataSourceRemoteJrs _create');
      log('$e');
      log('$s');
      rethrow;
    }
  }

  Future<void> _update(TodoModel model) async {
    try {
      dio.put('/todos/${model.id}', data: model.toJson());
    } on DioError catch (e, s) {
      log('DioError em TodoDataSourceRemoteJrs _update');
      log('$e');
      log('$s');
      rethrow;
    } catch (e, s) {
      log('Error em TodoDataSourceRemoteJrs _update');
      log('$e');
      log('$s');
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      dio.delete('/todos/$id');
    } on DioError catch (e, s) {
      log('DioError em TodoDataSourceRemoteJrs delete');
      log('$e');
      log('$s');
      rethrow;
    } catch (e, s) {
      log('Error em TodoDataSourceRemoteJrs delete');
      log('$e');
      log('$s');
      rethrow;
    }
  }
}
