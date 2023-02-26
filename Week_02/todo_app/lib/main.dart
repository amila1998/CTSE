import 'package:flutter/material.dart';
import 'Models/Task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// stateful widget for the home screen of the app
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Store the list of tasks
  List<Task> _tasks = [];

  // Method to add a new task to the list
  void _addTask(String taskName) {
    setState(() {
      _tasks.add(Task(name: taskName));
    });
  }

// Toggle the completion status of a task
  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(_tasks[index].name),
            selected: _tasks[index].isCompleted,
            value: _tasks[index].isCompleted,
            onChanged: (bool? value) {
              _toggleTaskCompletion(index);
            },
          );
        },
      ),
      //Add a new task name
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('New Task'),
                content: TextField(
                  autofocus: true,
                  onSubmitted: (String taskName) {
                    _addTask(taskName);
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
