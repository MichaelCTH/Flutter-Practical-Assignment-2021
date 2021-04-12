library todo_cubit;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState());

  void init() {
    emit(
      TodoState(data: const <TodoModel>[
        TodoModel(id: 'id-0', title: 'Todo 0'),
        TodoModel(id: 'id-1', title: 'Todo 1'),
        TodoModel(id: 'id-2', title: 'Todo 2'),
      ]),
    );
  }

  /// @TODO: Add a todo item
  void add(TodoModel todo) {}

  /// @TODO: Remove a todo item by index
  void remove(int index) {}

  /// @TODO: Toggle a todo item's complete status
  void toggle(int index) {}
}
