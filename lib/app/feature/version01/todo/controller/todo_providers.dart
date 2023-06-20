import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/todo_model.dart';
import 'todo_notifiers.dart';
import 'todo_states.dart';

// ++++++++++++++++++++++++++++++++++++++++++
// Nomenclatura Antiga
// ++++++++++++++++++++++++++++++++++++++++++
final readToDosProvider =
    AsyncNotifierProvider<TodoListAsyncNotifier, List<TodoModel>>(() {
  return TodoListAsyncNotifier();
});

final toDosFilteredByProvider = StateProvider<ToDosFilter>((ref) {
  return ToDosFilter.all;
});

final toDosFilteredProvider = Provider<AsyncValue<List<TodoModel>>>((ref) {
  final filteredBy = ref.watch(toDosFilteredByProvider);
  final allTodos = ref.watch(readToDosProvider);
  return switch (filteredBy) {
    ToDosFilter.completed => allTodos.whenData(
        (value) => value.where((element) => element.isCompleted).toList()),
    ToDosFilter.unCompleted => allTodos.whenData(
        (value) => value.where((element) => !element.isCompleted).toList()),
    _ => allTodos
  };
});
final toDosCounterProvider = Provider<AsyncValue<int>>((ref) {
  return ref.watch(toDosFilteredProvider).whenData((value) => value.length);
});

final toDoCurrentProvider =
    Provider<TodoModel>((ref) => throw UnimplementedError());
