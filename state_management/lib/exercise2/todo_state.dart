part of todo_cubit;

class TodoState extends Equatable {
  final List<TodoModel> data;

  const TodoState({this.data = const <TodoModel>[]});

  /// Return a TOTALLY new [TodoState]
  TodoState copyWith(List<TodoModel> data) {
    return TodoState(data: this.data);
  }

  TodoState add(TodoModel todo) {
    return TodoState(data: this.data);
  }

  TodoState remove(int index) {
    return TodoState(data: this.data);
  }

  TodoState toggle(int index, bool completed) {
    return TodoState(data: this.data);
  }

  /// Will rewrite operator == by [Equatable]
  @override
  List<Object> get props => [data];

  @override
  String toString() => data.map((each) => '$each').join('\n');
}
