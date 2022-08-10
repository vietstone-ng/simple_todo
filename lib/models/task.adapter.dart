import 'package:hive/hive.dart';
import 'package:simple_todo/models/task.dart';

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final id = reader.readString();
    final title = reader.readString();
    final completed = reader.readBool();
    return Task(id: id, title: title, completed: completed);
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeBool(obj.completed);
  }
}
