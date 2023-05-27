import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/todo_model.dart';
import 'controller/todo_providers.dart';
import 'todo_card.dart';

class TodoListFiltered extends ConsumerWidget {
  const TodoListFiltered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('ConsumerWidget TodoListFiltered build');
    final todoListAsyNotProvIW = ref.watch(filteredTodosProv);
    return todoListAsyNotProvIW.when(
      data: (data) {
        return _ListView(data);

        // return SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       for (final todo in data) TodoCard(model: todo),
        //     ],
        //   ),
        // );
      },
      error: (error, stackTrace) {
        return Center(
          child: Column(children: [
            const Text('Error'),
            Text(error.toString()),
            Text(stackTrace.toString()),
          ]),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class _ListView extends ConsumerWidget {
  final List<TodoModel> data;
  const _ListView(this.data);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      // itemCount: data.length,
      itemCount: ref.watch(countTodosProv).asData?.value,
      itemBuilder: (context, index) {
        log('ConsumerWidget TodoListFiltered ListView.builder');
        final item = data[index];
        // return TodoCard(model: item);
        return ProviderScope(
            overrides: [itemProvider.overrideWith((ref) => item)],
            child: const TodoCard());
      },
    );
  }
}
