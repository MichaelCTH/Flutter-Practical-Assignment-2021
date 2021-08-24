import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  static final title = 'Exercise 1';
  static final routeName = '/exercise1';

  const Exercise1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(title),
    );

    return Scaffold(
      appBar: appbar,
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
              flex: 1,
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
