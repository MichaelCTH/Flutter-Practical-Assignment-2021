import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/todo_cubit.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (context) => TodoCubit()..init(),
      child: Scaffold(
        appBar: AppBar(title: Text('Todo App')),
        body: Center(
          child: Text('@TODO Implement the TODO App'),
        ),
      ),
    );
  }
}
