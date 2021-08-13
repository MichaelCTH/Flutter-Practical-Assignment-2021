import 'package:flutter/material.dart';

class Exercise5 extends StatelessWidget {
  static final title = 'Exercise 5';
  static final routeName = '/exercise5';

  const Exercise5({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.green,
              width: double.infinity,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.purple,
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.deepPurple,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.amber,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.orange.shade900,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.pink,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    4,
                    (index) => Card(
                      color: Colors.lightBlue,
                      child: Container(
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
