import 'package:flutter/material.dart';

class Exercise2 extends StatelessWidget {
  static final title = 'Exercise 2';
  static final routeName = '/exercise2';

  const Exercise2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.yellow,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
