import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/todo_providers.dart';

class CountTodos extends ConsumerWidget {
  const CountTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('CountTodos build');
    final toDosCounter = ref.watch(toDosCounterProvider);
    return toDosCounter.when(data: (data) {
      return Text("$data ToDo's");
    }, error: (e, st) {
      return const Text('erro');
    }, loading: () {
      return const Text("... ToDo's");
    });
  }
}
