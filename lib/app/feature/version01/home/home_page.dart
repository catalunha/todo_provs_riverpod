import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/todo_model.dart';
import '../todo/controller/todo_providers.dart';
import '../todo/count_todo.dart';
import '../todo/filter_todo.dart';
import '../todo/save_todo.dart';
import '../todo/todo_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('HomePage build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo com Riverpod - Versao 01'),
      ),
      body: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 70, child: CountTodos()),
              Flexible(
                child: FilterTodos(),
              ),
            ],
          ),
          Divider(),
          Flexible(child: TodoList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showSaveTodo(context, null) as TodoModel?;
          if (result != null) {
            ref.read(readToDosProvider.notifier).save(result);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
