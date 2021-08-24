library todo_cubit;

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState(data: []));

  void init() {
    emit(
      TodoState(data: const <TodoModel>[
        TodoModel(id: 'id-0', title: 'Todo 0'),
        TodoModel(id: 'id-1', title: 'Todo 1'),
        TodoModel(id: 'id-2', title: 'Todo 2'),
      ]),
    );
  }

  void add(TodoModel todo) {
    // state.add(todo);

    emit(state.add(todo));
  }

  void remove(int index) {
    emit(state.remove(index));
  }

  void toggle(int index) {
    emit(state.toggle(index));
  }

  @override
  void onChange(Change<TodoState> change) {
    print('current state : ' + change.currentState.toString());
    super.onChange(change);
  }
}
