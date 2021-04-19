import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  final int id;
  final String title;
  final String content;

  const NewsModel({this.id, this.title, this.content});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }

  @override
  List<Object> get props => [id, title, content];
}
