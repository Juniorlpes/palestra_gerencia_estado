import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:open_mind_sm/home_page.dart';
import 'package:open_mind_sm/todo_controller.dart';

void main() {
  runApp(
    BlocProvider(
      blocs: [
        Bloc((i)=>TodoController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Open Mind',
        home: HomePage(),
      ),
    )
  );
}


