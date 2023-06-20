import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/todo_model.dart';
import '../../../../data/repositories/repositories_providers.dart';
import 'todo_states.dart';

part 'todo_providers.g.dart';

// ++++++++++++++++++++++++++++++++++++++++++
// Nomenclatura Antiga
// ++++++++++++++++++++++++++++++++++++++++++
// final todosAsyNotProv =
//     AsyncNotifierProvider<TodoListAsyncNotifier, List<TodoModel>>(() {
//   return TodoListAsyncNotifier();
// });

// final filterTodosByProv = StateProvider<ToDosFilter>((ref) {
//   return ToDosFilter.all;
// });

// final filteredTodosProv = Provider<AsyncValue<List<TodoModel>>>((ref) {
//   final filteredBy = ref.watch(filterTodosByProv);
//   final allTodos = ref.watch(todosAsyNotProv);
//   return switch (filteredBy) {
//     ToDosFilter.completed => allTodos.whenData(
//         (value) => value.where((element) => element.isCompleted).toList()),
//     ToDosFilter.unCompleted => allTodos.whenData(
//         (value) => value.where((element) => !element.isCompleted).toList()),
//     _ => allTodos
//   };
// });
// final countTodosProv = Provider<AsyncValue<int>>((ref) {
//   return ref.watch(filteredTodosProv).whenData((value) => value.length);
// });

// final indexProvider = Provider<int>((_) => 0);
// final todoProvider = Provider<TodoModel>((ref) => throw UnimplementedError());
// final listProvider = Provider<AsyncValue<List<TodoModel>>>(
//     (ref) => ref.watch(filteredTodosProv).whenData((value) => value));

// ++++++++++++++++++++++++++++++++++++++++++
// Nomenclatura nova
// ++++++++++++++++++++++++++++++++++++++++++

@riverpod
Future<int> toDosCounter(ToDosCounterRef ref) async {
  final allTodos = await ref.watch(toDosFilteredProvider.future);

  return allTodos.length;
}

@riverpod
TodoModel toDoCurrent(ToDoCurrentRef ref) {
  return throw UnimplementedError();
}

@riverpod
FutureOr<List<TodoModel>> toDosFiltered(ToDosFilteredRef ref) async {
  final filteredBy = ref.watch(toDosFilteredByProvider);
  final allTodos = await ref.watch(readToDosProvider.future);
  return switch (filteredBy) {
    ToDosFilter.completed =>
      allTodos.where((element) => element.isCompleted).toList(),
    ToDosFilter.unCompleted =>
      allTodos.where((element) => !element.isCompleted).toList(),
    _ => allTodos.toList()
  };
}

// @riverpod
// List<TodoModel> toDosFiltered(ToDosFilteredRef ref) {
//   final filteredBy = ref.watch(toDosFilteredByProvider);
//   final allTodos = ref.watch(readToDosProvider);
//   // return allTodos.maybeWhen(data: (data) => data.where((element) => element.isCompleted).toList(), orElse: ()=>[]);
//   return switch (filteredBy) {
//     ToDosFilter.completed => allTodos.maybeWhen(
//         data: (data) => data.where((element) => element.isCompleted).toList(),
//         orElse: () => []),
//     ToDosFilter.unCompleted => allTodos.maybeWhen(
//         data: (data) => data.where((element) => !element.isCompleted).toList(),
//         orElse: () => []),
//     _ => allTodos.when(data: (data) => data,error: (error, stackTrace) => [],loading: () => [],)
//   };
// }

@riverpod
class ToDosFilteredBy extends _$ToDosFilteredBy {
  @override
  ToDosFilter build() {
    return ToDosFilter.all;
  }

  void set(ToDosFilter value) {
    state = value;
  }
}

@riverpod
class ReadToDos extends _$ReadToDos {
  @override
  FutureOr<List<TodoModel>> build() {
    return _read();
  }

  FutureOr<List<TodoModel>> _read() async {
    state = const AsyncValue.loading();

    try {
      final todoRep = ref.read(todoRepositoryProvider);

      return await todoRep.read();
    } catch (e, s) {
      print('Erro em ReadToDos _read');
      print(e);
      print(s);
      state = AsyncValue.error(e, s);
      return [];
    }
  }

  Future<void> toggle(TodoModel model) async {
    state = const AsyncValue.loading();
    try {
      final todoRep = ref.read(todoRepositoryProvider);
      await todoRep.toggle(model);

      final list = await _read();
      state = AsyncValue.data(list);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
    // state = await AsyncValue.guard(() async {
    //   final todoRep = ref.read(todoRepositoryProvider);
    //   await todoRep.toggle(model);
    //   return await _read();
    // });
  }

  Future<void> save(TodoModel model) async {
    state = const AsyncValue.loading();
    try {
      final todoRep = ref.read(todoRepositoryProvider);
      await todoRep.save(model);
      final list = await _read();
      state = AsyncValue.data(list);
    } catch (err, stack) {
      AsyncValue.error(err, stack);
    }
    // state = await AsyncValue.guard(() async {
    //   final todoRep = ref.read(todoRepositoryProvider);
    //   await todoRep.save(model);
    //   return await _read();
    // });
  }
}
