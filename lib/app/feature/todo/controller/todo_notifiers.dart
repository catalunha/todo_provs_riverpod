import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_provs_riverpod/app/core/models/todo_model.dart';

import '../../../data/repositories/repositories_providers.dart';

class TodoListAsyncNotifier extends AsyncNotifier<List<TodoModel>> {
  @override
  FutureOr<List<TodoModel>> build() {
    return _getAll();
  }

  Future<List<TodoModel>> _getAll() async {
    state = const AsyncValue.loading();

    final todoRep = ref.read(todoRepository);

    return await todoRep.getAll();
  }

  Future<void> toggle(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      final todoRep = ref.read(todoRepository);
      todoRep.toggle(id);
      return _getAll();
    });
  }

  Future<void> save(TodoModel todoModel) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      final todoRep = ref.read(todoRepository);
      todoRep.save(todoModel);
      return _getAll();
    });
  }
}
