// import 'package:todo_provs_riverpod/app/core/models/todo_model.dart';
// import 'package:uuid/uuid.dart';

// class TodoDataSource {
//   // List<TodoModel> todos = [
//   //   TodoModel(
//   //       id: '1',
//   //       description:
//   //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//   //       isCompleted: true),
//   //   TodoModel(id: '2', description: 'b', isCompleted: false),
//   // ];
//   // Future<List<TodoModel>> getAll() async {
//   //   await Future.delayed(const Duration(seconds: 1));
//   //   return todos;
//   //   // return await Future.value(todos);
//   // }

//   Future<void> toggle(int id) async {
//     await Future.delayed(const Duration(seconds: 1));
//     print('toggle previus: $todos');

//     final index = todos.indexWhere((element) => element.id == id);
//     // final todosLocal = [...todos];
//     if (index >= 0) {
//       final TodoModel todoTemp = todos[index];
//       final TodoModel todoTemp2 =
//           todoTemp.copyWith(isCompleted: !todoTemp.isCompleted);
//       todos.replaceRange(index, index + 1, [todoTemp2]);
//     }
//     print('toggle next: $todos');
//     // await Future.value(todos);
//   }

//   Future<void> save(TodoModel todoModel) async {
//     await Future.delayed(const Duration(seconds: 1));

//     if (todoModel.id == null) {
//       todos.add(todoModel.copyWith(id: const Uuid().v4()));
//     } else {
//       final index = todos.indexWhere((element) => element.id == todoModel.id);
//       if (index >= 0) {
//         todos.replaceRange(index, index + 1, [todoModel]);
//       }
//     }
//   }
// }
