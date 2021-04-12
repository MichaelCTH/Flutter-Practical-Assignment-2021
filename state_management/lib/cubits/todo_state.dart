part of todo_cubit;

class TodoState extends Equatable {
  final List<TodoModel> data;

  const TodoState({this.data = const <TodoModel>[]});

  /// Return a TOTALLY new [TodoState]
  TodoState copyWith(List<TodoModel> data) {
    return TodoState(data: data ?? this.data);
  }

  TodoState add(TodoModel todo) {
    /// @TODO: Finish this add method
  }

  TodoState remove(int index) {
    /// @TODO: Finish this [remove] method
  }

  TodoState toggle(int index, bool completed) {
    /// @TODO: Finish this [toggle] method
  }

  /// Will rewrite operator == by [Equatable]
  @override
  List<Object> get props => [data];

  @override
  String toString() => data.map((each) => '$each').join('\n');
}
