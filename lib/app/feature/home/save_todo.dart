import 'package:flutter/material.dart';

import '../../core/models/todo_model.dart';

Future<void> showSaveTodo(BuildContext context, TodoModel? todoModel) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      final description = TextEditingController();
      description.text = todoModel == null ? '' : todoModel.description;
      return Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                todoModel == null
                    ? const Text('Add ToDo')
                    : const Text('Edit ToDo'),
                TextField(controller: description),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop<String>(context, null);
                        },
                        child: const Text('Cancelar')),
                    FilledButton(
                      onPressed: () {
                        todoModel == null
                            ? Navigator.pop<TodoModel>(
                                context,
                                description.text.isEmpty
                                    ? null
                                    : TodoModel(
                                        description: description.text,
                                        isCompleted: false))
                            : Navigator.pop<TodoModel>(
                                context,
                                description.text.isEmpty
                                    ? null
                                    : TodoModel(
                                        id: todoModel.id,
                                        description: description.text,
                                        isCompleted: todoModel.isCompleted));
                        // Navigator.pop<TodoModel>(context,
                        //     description.text.isEmpty ? null : TodoModel(id,description: description.text, isCompleted: false));
                      },
                      child: const Row(
                        children: [Icon(Icons.check_circle), Text('Salvar')],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
