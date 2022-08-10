import 'package:uuid/uuid.dart';

// Describe the entity of a todo task.
class Task {
  final String id;
  final String title;
  final bool completed;

  Task({
    String? id,
    required this.title,
    this.completed = false,
  }) : id = id ?? const Uuid().v4();

  Task copyWith({
    String? title,
    bool? completed,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  bool operator ==(other) {
    return (other is Task) &&
        other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode => Object.hash(id, title, completed);
}
