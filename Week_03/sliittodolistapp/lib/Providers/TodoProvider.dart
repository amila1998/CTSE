import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sliittodolistapp/Todo.dart';

class TodoProvider extends ChangeNotifier {
  // private field to represent the collection of todos in the database
  late CollectionReference _todosCollectionRef;

  // private field to store the list of todos retrieved from the database
  List<Todo> _todos = [];

// getter to retrieve the list of todos
  List<Todo> get todos => _todos;

  // constructor to initialize the TodoProvider
  TodoProvider() {
    _todosCollectionRef = FirebaseFirestore.instance.collection('todos');
    _loadTodos();
  }

// private method to load todos from the database
  Future<void> _loadTodos() async {
    try {
      final snapshot = await _todosCollectionRef.get();
      _todos =
          snapshot.docs.map((doc) => Todo.fromDocumentSnapshot(doc)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading todos: $e');
    }
  }

// method to add a new todo to the database and _todos list
  Future<void> addTodo(String title) async {
    try {
      final docRef =
          await _todosCollectionRef.add({'title': title, 'isCompleted': false});
      final todo = Todo(
        id: docRef.id,
        title: title,
        isCompleted: false,
      );
      _todos.add(todo);
      notifyListeners();
    } catch (e) {
      print('Error adding todo: $e');
    }
  }

  // method to update a todo in the database and _todos list
  Future<void> updateTodo(Todo todo) async {
    try {
      await _todosCollectionRef.doc(todo.id).update(todo.toMap());
      _todos[_todos.indexWhere((t) => t.id == todo.id)] = todo;
      notifyListeners();
    } catch (e) {
      print('Error updating todo: $e');
    }
  }

// method to delete a todo from the database and _todos list
  Future<void> deleteTodoById(String id) async {
    try {
      await _todosCollectionRef.doc(id).delete();
      _todos.removeWhere((todo) => todo.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting todo: $e');
    }
  }
}
