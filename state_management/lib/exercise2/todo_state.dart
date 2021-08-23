part of todo_cubit;

class TodoState extends Equatable {
  final List<TodoModel> data;

  const TodoState({this.data = const <TodoModel>[]});

  /// Return a TOTALLY new [TodoState]
  TodoState copyWith(List<TodoModel> data) {
    final dataCopy = data.map((e) => e.copyWith(completed: true)).toList();
    final newCopy = TodoState(data: dataCopy);
    return newCopy;
  }

  TodoState add(TodoModel todo) {
    var temp = this.copyWith(this.data);

    int max = 0;
    if (todo.id.isEmpty) {
      this.data.forEach((element) {
        max = int.parse(element.id.replaceAll('id-', ''));
      });
      var newOne =
          TodoModel(id: 'id-' + (max + 1).toString(), title: todo.title);
      temp.data.add(newOne);
    }

    print('111111:' + this.data.toString());

    return temp;
  }

  TodoState remove(int index) {
    var temp = this.copyWith(this.data);
    temp.data.removeAt(1);

    print(temp);
    return temp;
  }

  TodoState toggle(int index) {
    var temp = this.copyWith(this.data);
    var item = temp.data[index];
    temp.data[index] =
        TodoModel(id: item.id, title: item.title, completed: !item.completed);

    return temp;
  }

  /// Will rewrite operator == by [Equatable]
  @override
  List<Object> get props => [data];

  @override
  String toString() => data.map((each) => '$each').join('\n');
}
