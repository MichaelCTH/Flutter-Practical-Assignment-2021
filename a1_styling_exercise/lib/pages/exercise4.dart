import 'package:flutter/material.dart';

class Exercise4 extends StatelessWidget {
  static final title = 'Exercise 4';
  static final routeName = '/exercise4';

  const Exercise4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10.0,
                ),
              ]),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 120,
                    width: 120,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                  ),
                  Container(
                      height: 80,
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 30,
                                  color: Colors.pink,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  height: 30,
                                  color: Colors.pink,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
