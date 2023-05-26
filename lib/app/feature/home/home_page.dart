import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/todo_model.dart';
import '../todo/controller/todo_providers.dart';
import '../todo/todo_list_filtered.dart';
import 'count_todo.dart';
import 'filter_todo.dart';
import 'save_todo.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo com Riverpod - Providers'),
      ),
      body: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountTodos(),
              Flexible(
                child: FilterTodos(),
              ),
            ],
          ),
          // Divider(),
          // Flexible(child: TodoList()),
          Divider(),
          Flexible(child: TodoListFiltered()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showSaveTodo(context, null) as TodoModel?;
          if (result != null) {
            ref.read(todosAsyNotProv.notifier).save(result);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
