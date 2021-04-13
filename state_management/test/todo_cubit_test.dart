import 'package:bloc_test/bloc_test.dart';
import 'package:state_management/exercise2/todo_cubit.dart';
import 'package:state_management/models/todo.dart';

void main() {
  blocTest<TodoCubit, TodoState>(
    'It should initialze cubit successsfully',
    build: () => TodoCubit(),
    act: (cubit) => cubit.init(),
    expect: [
      TodoState(data: <TodoModel>[
        TodoModel(id: 'id-0', title: 'Todo 0'),
        TodoModel(id: 'id-1', title: 'Todo 1'),
        TodoModel(id: 'id-2', title: 'Todo 2'),
      ]),
    ],
  );

  blocTest<TodoCubit, TodoState>(
    'It should add todo successsfully',
    build: () => TodoCubit(),
    act: (cubit) => cubit.add(TodoModel(title: 'Mock Title')),
    seed: TodoState(data: <TodoModel>[
      TodoModel(id: 'id-0', title: 'Todo 0'),
      TodoModel(id: 'id-1', title: 'Todo 1'),
      TodoModel(id: 'id-2', title: 'Todo 2'),
    ]),
    expect: [
      TodoState(data: <TodoModel>[
        TodoModel(id: 'id-0', title: 'Todo 0'),
        TodoModel(id: 'id-1', title: 'Todo 1'),
        TodoModel(id: 'id-2', title: 'Todo 2'),
        TodoModel(id: 'id-3', title: 'Mock Title'),
      ]),
    ],
  );

  blocTest<TodoCubit, TodoState>(
    'It should remove todo successsfully',
    build: () => TodoCubit(),
    act: (cubit) => cubit.remove(1),
    seed: TodoState(data: <TodoModel>[
      TodoModel(id: 'id-0', title: 'Todo 0'),
      TodoModel(id: 'id-1', title: 'Todo 1'),
      TodoModel(id: 'id-2', title: 'Todo 2'),
    ]),
    expect: [
      TodoState(data: <TodoModel>[
        TodoModel(id: 'id-0', title: 'Todo 0'),
        TodoModel(id: 'id-2', title: 'Todo 2'),
      ]),
    ],
  );

  blocTest<TodoCubit, TodoState>(
    'It should toggle todo successsfully',
    build: () => TodoCubit(),
    act: (cubit) => cubit.toggle(1),
    seed: TodoState(data: <TodoModel>[
      TodoModel(id: 'id-0', title: 'Todo 0'),
      TodoModel(id: 'id-1', title: 'Todo 1'),
      TodoModel(id: 'id-2', title: 'Todo 2'),
    ]),
    expect: [
      TodoState(data: <TodoModel>[
        TodoModel(id: 'id-0', title: 'Todo 0'),
        TodoModel(id: 'id-1', title: 'Todo 1', completed: true),
        TodoModel(id: 'id-2', title: 'Todo 2'),
      ]),
    ],
  );
}
