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

  void add(TodoModel todo) {
    int max = 0;
    if (todo.id.isEmpty) {
      state.data.forEach((element) {
        max = int.parse(element.id.replaceAll('id-', ''));
      });
      var newOne =
          TodoModel(id: 'id-' + (max + 1).toString(), title: todo.title);
      state.data.add(newOne);
      return;
    }
    state.data.add(todo);
  }

  void remove(int index) {
    state.data.removeAt(index);
  }

  void toggle(int index) {
    var item = state.data[index];
    state.data[index] =
        TodoModel(id: item.id, title: item.title, completed: !item.completed);
  }
}
