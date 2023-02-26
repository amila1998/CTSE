import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String id;
  final String title;
  final bool isCompleted;
  final String userId;

  Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.userId,
  });

  // Factory method to create a Todo object from a DocumentSnapshot
  factory Todo.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return Todo(
      id: snapshot.id,
      title: snapshot['title'],
      isCompleted: snapshot['isCompleted'],
      userId: snapshot['userId'],
    );
  }

  // Converts a Todo object to a Map of key-value pairs for storing in Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }
  
  // Returns a new Todo object with specified properties replaced
  Todo copyWith({
    String? id,
    String? title,
    bool? completed,
    String? userId,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: completed ?? isCompleted,
      userId: userId ?? this.userId,
    );
  }
}
