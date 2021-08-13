import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String id;
  final String title;
  final bool completed;

  const TodoModel({this.id = '', this.title = '', this.completed = false});

  TodoModel copyWith(
      {String id = '', String title = '', required bool completed}) {
    return TodoModel(
      id: this.id,
      title: this.title,
      completed: this.completed,
    );
  }

  @override
  List<Object> get props => [id, title, completed];

  @override
  String toString() => '{ $id, $title, $completed }';
}
