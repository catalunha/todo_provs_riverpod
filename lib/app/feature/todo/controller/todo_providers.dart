import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/todo_model.dart';
import 'todo_notifiers.dart';
import 'todo_states.dart';

final todosAsyNotProv =
    AsyncNotifierProvider<TodoListAsyncNotifier, List<TodoModel>>(() {
  return TodoListAsyncNotifier();
});

final filterTodosByProv = StateProvider<FilterTodosBy>((ref) {
  return FilterTodosBy.all;
});

final filteredTodosProv = Provider<AsyncValue<List<TodoModel>>>((ref) {
  final filteredBy = ref.watch(filterTodosByProv);
  final allTodos = ref.watch(todosAsyNotProv);
  return switch (filteredBy) {
    FilterTodosBy.completed => allTodos.whenData(
        (value) => value.where((element) => element.isCompleted).toList()),
    FilterTodosBy.unCompleted => allTodos.whenData(
        (value) => value.where((element) => !element.isCompleted).toList()),
    _ => allTodos
  };
});
final countTodosProv = Provider<AsyncValue<int>>((ref) {
  return ref.watch(filteredTodosProv).whenData((value) => value.length);
});

final indexProvider = Provider<int>((_) => 0);
final itemProvider = Provider<TodoModel>((_) => throw UnimplementedError());
