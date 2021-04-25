import 'package:todo/state/todo.state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/todo.screen.dart';
import 'package:todo/screens/create.screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: TodoApplication(),
    ),
  );
}

class TodoApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      initialRoute: '/',
      routes: {
        '/': (context) => TodoScreen(),
        '/create': (context) => CreateScreen(),
      },
    );
  }
}
