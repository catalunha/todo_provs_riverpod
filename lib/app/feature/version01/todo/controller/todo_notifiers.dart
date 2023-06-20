import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_provs_riverpod/app/core/models/todo_model.dart';

import '../../../../data/repositories/repositories_providers.dart';

class TodoListAsyncNotifier extends AsyncNotifier<List<TodoModel>> {
  @override
  FutureOr<List<TodoModel>> build() {
    return _getAll();
  }

  Future<List<TodoModel>> _getAll() async {
    state = const AsyncValue.loading();

    try {
      final todoRep = ref.read(todoRepositoryProvider);

      return await todoRep.read();
    } catch (e, s) {
      print('Erro em TodoListAsyncNotifier _getAll');
      print(e);
      print(s);
      state = AsyncValue.error(e, s);
      return [];
    }
  }

  Future<void> toggle(TodoModel model) async {
    state = const AsyncValue.loading();
    // try {
    //   final todoRep = ref.read(todoRepository);
    //   await todoRep.toggle(model);
    //   final List<TodoModel> a = [...state.value!];
    //   // print(a);
    //   final index = a.indexWhere((element) => element.id == model.id);
    //   a.replaceRange(index, index + 1, [model]);
    //   // print(a);
    //   state = AsyncValue.data(a);
    // } catch (err, stack) {
    //   state = AsyncValue.error(err, stack);
    // }
    state = await AsyncValue.guard(() async {
      final todoRep = ref.read(todoRepositoryProvider);
      await todoRep.toggle(model);
      return await _getAll();
    });
  }

  Future<void> save(TodoModel model) async {
    state = const AsyncValue.loading();
    // try {
    //   final todoRep = ref.read(todoRepository);
    //   AsyncValue.data(await todoRep.save(model));
    // } catch (err, stack) {
    //   AsyncValue.error(err, stack);
    // }
    state = await AsyncValue.guard(() async {
      final todoRep = ref.read(todoRepositoryProvider);
      await todoRep.save(model);
      return await _getAll();
    });
  }
}
