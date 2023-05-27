import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../todo/controller/todo_providers.dart';

class CountTodos extends ConsumerWidget {
  const CountTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countTodos = ref.watch(countTodosProv).asData?.value;
    return Text('$countTodos ToDos');
  }
}
