import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_provs_riverpod/app/core/models/todo_model.dart';

import '../home/save_todo.dart';
import 'controller/todo_providers.dart';

class TodoCard extends ConsumerWidget {
  const TodoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(todoProvider);
    log('ConsumerWidget TodoCard build ${model.id}');
    return Card(
      margin: const EdgeInsets.all(10),
      child: Row(children: [
        Checkbox(
          value: model.isCompleted,
          onChanged: (value) {
            ref.read(todosAsyNotProv.notifier).toggle(model);
          },
        ),
        Expanded(child: Text(model.description)),
        IconButton(
            onPressed: () async {
              final result = await showSaveTodo(context, model) as TodoModel?;
              if (result != null) {
                ref.read(todosAsyNotProv.notifier).save(result);
              }
            },
            icon: const Icon(Icons.edit))
      ]),
    );
  }
}
