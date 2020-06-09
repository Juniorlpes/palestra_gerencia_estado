import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_mind_sm/todo_model.dart';

class TodoController with ChangeNotifier{

  List<TodoModel> todos = [
    TodoModel(todo: "Fazer qqr coisa"),
    TodoModel(todo: "Fazer exercício"),
    TodoModel(todo: "Comer", checked: true),
  ];

  setCheck(TodoModel model){
    model.checked = !model.checked;
    notifyListeners();
  }

  removeModel(TodoModel model){
    todos.remove(model);
    notifyListeners();
  }

  addModel(TodoModel model){
    todos.add(model);
    notifyListeners();
  }

}