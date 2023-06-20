import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/todo_providers.dart';
import 'controller/todo_states.dart';

class FilterTodos extends ConsumerWidget {
  const FilterTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('FilterTodos build');

    final filteredBy = ref.watch(toDosFilteredByProvider);
    return Wrap(
      children: [
        TextButton(
          onPressed: () {
            ref.read(toDosFilteredByProvider.notifier).set(ToDosFilter.all);
          },
          style: filteredBy == ToDosFilter.all
              ? TextButton.styleFrom(foregroundColor: Colors.orange)
              : null,
          child: const Text('All'),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(toDosFilteredByProvider.notifier)
                .set(ToDosFilter.completed);
          },
          style: filteredBy == ToDosFilter.completed
              ? TextButton.styleFrom(foregroundColor: Colors.orange)
              : null,
          child: const Text('Completed'),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(toDosFilteredByProvider.notifier)
                .set(ToDosFilter.unCompleted);
          },
          style: filteredBy == ToDosFilter.unCompleted
              ? TextButton.styleFrom(foregroundColor: Colors.orange)
              : null,
          child: const Text('unCompleted'),
        ),
      ],
    );
  }
}
