//model class for the to-do tasks
class Task {
    String name; //name of the task
    bool isCompleted; // completion f the task
  
    Task({required this.name, this.isCompleted = false}); // Constructor that sets the name and completion status of the task
  }