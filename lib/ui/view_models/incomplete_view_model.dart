import 'package:flutter/material.dart';
import 'package:simple_todo/ui/view_models/todos_view_model.dart';

// // ViewModel for Incomplete screen. This extracts only completed todos from TodosService.
class IncompleteViewModel implements TodosViewModel {
  const IncompleteViewModel();

  @override
  Color get color => Colors.yellow;
}
