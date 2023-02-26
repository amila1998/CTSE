import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliittodolistapp/Providers/TodoProvider.dart';
import 'package:sliittodolistapp/Todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: Colors.grey,
      //checkbox to mark as completed or not
      leading: Checkbox(
        activeColor: Colors.green,
        value: todo.isCompleted,
        onChanged: (value) {
          final updatedTodo = Todo(
            id: todo.id,
            title: todo.title,
            isCompleted: value ?? false,
          );
          Provider.of<TodoProvider>(context, listen: false)
              .updateTodo(updatedTodo);
        },
      ),
      // Displaying the title of the todo item
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: todo.isCompleted ? Colors.black : Colors.blue,
        ),
      ),
      //delete icon button to delete the todo item
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever),
        onPressed: () {
          Provider.of<TodoProvider>(context, listen: false)
              .deleteTodoById(todo.id);
        },
      ),
    );
  }
}
