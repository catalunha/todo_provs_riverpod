import 'package:flutter/material.dart';

import '../../core/models/todo_model.dart';

Future<void> showSaveTodo(BuildContext context, TodoModel? todoModel) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      final title = TextEditingController();
      title.text = todoModel == null ? '' : todoModel.title;
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
                TextField(controller: title),
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
                                title.text.isEmpty
                                    ? null
                                    : TodoModel(
                                        title: title.text, isCompleted: false))
                            : Navigator.pop<TodoModel>(
                                context,
                                title.text.isEmpty
                                    ? null
                                    : TodoModel(
                                        id: todoModel.id,
                                        title: title.text,
                                        isCompleted: todoModel.isCompleted));
                        // Navigator.pop<TodoModel>(context,
                        //     title.text.isEmpty ? null : TodoModel(id,title: title.text, isCompleted: false));
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
