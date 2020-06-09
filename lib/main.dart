import 'package:flutter/material.dart';
import 'package:open_mind_sm/home_page.dart';
import 'package:open_mind_sm/todo_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TodoController>.value(value: TodoController())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Mind',
      home: HomePage(),
    ),
  ));
}


