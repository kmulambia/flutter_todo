import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo/model/todo.model.dart';

class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  void add(Todo todo) {
    todo.id = todos.last.id + 1;
    todo.isDone = false;
    _todos.add(todo);
    notifyListeners();
  }

  void update(int id, String newTitle, String newDescription) {
    var todo = _todos.firstWhere((todo) => todo.id == id);
    todo.title = newTitle;
    todo.description = newDescription;
    notifyListeners();
  }

  void delete(int id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  Todo read(int id) {
    return _todos.firstWhere((element) => element.id == id);
  }

  void toggleDone(int id) {
    var index = _todos.indexWhere((element) => element.id == id);
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }

  void remove(int id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
