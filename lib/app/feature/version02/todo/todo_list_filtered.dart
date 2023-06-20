import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/todo_providers.dart';
import 'todo_card.dart';

class TodoListFiltered extends ConsumerWidget {
  const TodoListFiltered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('TodoListFiltered build');
    final todoListAsyNotProvIW = ref.watch(toDosFilteredProvider);
    return todoListAsyNotProvIW.when(
      data: (data) {
        return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            children: [
              for (var i = 0; i < data.length; i++) ...[
                // if (i > 0) const Divider(height: 0),
                Dismissible(
                  key: ValueKey(data[i].id),
                  onDismissed: (_) {
                    // ref.read(todoListProvider.notifier).remove(data[i]);
                  },
                  child: ProviderScope(
                    overrides: [
                      toDoCurrentProvider.overrideWithValue(data[i]),
                    ],
                    child: const TodoCard(),
                  ),
                )
              ],
            ]);

        // return ListView.builder(
        //   // itemCount: data.length,
        //   itemCount: ref.watch(countTodosProv).asData?.value,
        //   itemBuilder: (context, index) {
        //     log('ConsumerWidget TodoListFiltered ListView.builder');
        //     // final item = data[index];
        //     // return TodoCard(model: item);
        //     // return ProviderScope(
        //     //     overrides: [todoProvider.overrideWith((ref) => item)],
        //     //     child: const TodoCard());
        //     return ProviderScope(
        //         overrides: [indexProvider.overrideWithValue(index)],
        //         child: const _ListView());
        //   },
        // );
        // return const _ListView();

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

// class _ListView extends ConsumerWidget {
//   const _ListView();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final list = ref.watch(listProvider).whenData((value) => value);
//     // final index = ref.watch(indexProvider);

//     return ListView.builder(
//       // itemCount: data.length,
//       itemCount: ref.watch(countTodosProv).asData?.value,
//       itemBuilder: (context, index) {
//         log('ConsumerWidget TodoListFiltered ListView.builder');
//         final item = list.whenData((value) => value[index]).asData!.value;
//         // return TodoCard(model: item);
//         return ProviderScope(
//             overrides: [todoProvider.overrideWith((ref) => item)],
//             child: const TodoCard());
//         // return ProviderScope(
//         //     overrides: [indexProvider.overrideWithValue(index)],
//         //     child: const _ListView());
//       },
//     );
//   }
// }


// class _ListView extends ConsumerWidget {
//   const _ListView();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final list = ref.watch(listProvider).whenData((value) => value);
//     // final index = ref.watch(indexProvider);
// list.
//         return ListView(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//             children: [
//               for (var i = 0; i < data.length; i++) ...[
//                 if (i > 0) const Divider(height: 0),
//                 Dismissible(
//                   key: ValueKey(data[i].id),
//                   onDismissed: (_) {
//                     // ref.read(todoListProvider.notifier).remove(data[i]);
//                   },
//                   child: ProviderScope(
//                     overrides: [
//                       todoProvider.overrideWithValue(data[i]),
//                     ],
//                     child: const TodoCard(),
//                   ),
//                 )
//               ],
//             ]);
//     );
//   }
// }
