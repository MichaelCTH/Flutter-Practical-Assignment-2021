import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  static final title = 'Exercise 1';
  static final routeName = '/exercise1';

  const Exercise1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: null,
    );
  }
}
