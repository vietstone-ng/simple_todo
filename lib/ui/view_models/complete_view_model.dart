import 'package:flutter/material.dart';
import 'package:simple_todo/ui/view_models/todos_view_model.dart';

// ViewModel for Complete screen. This extracts only completed todos from TodosService.
class CompleteViewModel implements TodosViewModel {
  const CompleteViewModel();

  @override
  Color get color => Colors.greenAccent;
}
