import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/todo.dart';

final data = <TodoModel>[
  TodoModel(id: 'id-0', title: 'Todo 0'),
  TodoModel(id: 'id-1', title: 'Todo 1'),
  TodoModel(id: 'id-2', title: 'Todo 2'),
];

class TodoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// @TODO: Implement your todo item here.
    return Text('Todo');
  }
}

class TodoAppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // @TODO: Implement the layout
    return Scaffold(
      body: Center(
        child: Text('Implement the layout'),
      ),
    );
  }
}
