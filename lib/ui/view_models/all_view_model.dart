import 'package:flutter/material.dart';
import 'package:simple_todo/ui/view_models/todos_view_model.dart';

// ViewModel for All screen. This extracts all todos from TodosService.
class AllViewModel implements TodosViewModel {
  const AllViewModel();

  @override
  Color get color => Colors.white;
}
