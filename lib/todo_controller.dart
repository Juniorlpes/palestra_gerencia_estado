import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:open_mind_sm/todo_model.dart';

class TodoController implements BlocBase {
  List<TodoModel> todos = [
    TodoModel(todo: "Fazer qqr coisa"),
    TodoModel(todo: "Fazer exercício"),
    TodoModel(todo: "Comer", checked: true),
  ];

  TodoController(){
    input.add(todos);
    count = todos.where((todo) => todo.checked).length;
    getInInt.add(count);
  }

  final StreamController<List<TodoModel>> _streamController = StreamController<List<TodoModel>>();
  Sink    get input   => _streamController.sink;
  Stream  get output  => _streamController.stream;

  int count;
  final StreamController<int> _streamCont = StreamController<int>();
  Sink    get getInInt   => _streamCont.sink;
  Stream  get getOutInt  => _streamCont.stream;

  addModel(TodoModel model){
    todos.add(model);
    input.add(todos);
  }

  removeModel(TodoModel model){
    todos.remove(model);
    input.add(todos);
  }

  setCheck(TodoModel model, int index){
    todos[index].checked = !todos[index].checked;
    input.add(todos);
    count = todos.where((todo) => todo.checked).length;
    getInInt.add(count);
  }

  @override
  void dispose() {
    _streamController.close();
    _streamCont.close();
  }

  @override
  void addListener(listener) {
  }
  @override
  bool get hasListeners => _streamController.hasListener;
  @override
  void notifyListeners() {
  }
  @override
  void removeListener(listener) {
  }

}