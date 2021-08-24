import 'package:flutter/material.dart';

class Exercise3 extends StatelessWidget {
  static final title = 'Exercise 3';
  static final routeName = '/exercise3';

  const Exercise3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            ...List.generate(
              4,
              (index) => Container(
                padding: EdgeInsets.only(left: 54.0 * index),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
