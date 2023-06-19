import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_provs_riverpod/app/feature/todo/controller/todo_states.dart';

import '../todo/controller/todo_providers.dart';

class FilterTodos extends ConsumerWidget {
  const FilterTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('FilterTodos build');

    final filteredBy = ref.watch(filterTodosByProv);
    return Wrap(
      children: [
        TextButton(
          onPressed: () {
            ref.read(filterTodosByProv.notifier).state = FilterTodosBy.all;
          },
          style: filteredBy == FilterTodosBy.all
              ? TextButton.styleFrom(foregroundColor: Colors.orange)
              : null,
          child: const Text('All'),
        ),
        TextButton(
          onPressed: () {
            ref.read(filterTodosByProv.notifier).state =
                FilterTodosBy.completed;
          },
          style: filteredBy == FilterTodosBy.completed
              ? TextButton.styleFrom(foregroundColor: Colors.orange)
              : null,
          child: const Text('Completed'),
        ),
        TextButton(
          onPressed: () {
            ref.read(filterTodosByProv.notifier).state =
                FilterTodosBy.unCompleted;
          },
          style: filteredBy == FilterTodosBy.unCompleted
              ? TextButton.styleFrom(foregroundColor: Colors.orange)
              : null,
          child: const Text('unCompleted'),
        ),
      ],
    );
  }
}
