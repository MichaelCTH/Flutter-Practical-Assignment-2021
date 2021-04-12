import 'package:flutter/material.dart';

import 'exercise1/layout.dart';
import 'exercise3/todo_page.dart';
import 'pages/cubit_page.dart';
import 'pages/provider_page.dart';
import 'pages/vanilla_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'State Management',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  child: Text('Vanilla Counter'),
                  onPressed: () => Navigator.pushNamed(context, '/vanilla'),
                ),
                ElevatedButton(
                  child: Text('Provider Counter'),
                  onPressed: () => Navigator.pushNamed(context, '/provider'),
                ),
                ElevatedButton(
                  child: Text('Cubit Counter'),
                  onPressed: () => Navigator.pushNamed(context, '/cubit'),
                ),
                Text(
                  'Todo App',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  child: Text('Exercise 1 - Essential Layout'),
                  onPressed: () => Navigator.pushNamed(context, '/todo-1'),
                ),
                Builder(
                  builder: (context) => ElevatedButton(
                    child: Text('Exercise 2 - Implement Cubit'),
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Open `lib/exercise2/todo_cubit.dart` and `lib/exercise2/todo_state.dart`',
                          ),
                        ),
                      );
                    },
                    // onPressed: () => Navigator.pushNamed(context, '/todo-2'),
                  ),
                ),
                ElevatedButton(
                  child: Text('Exercise 3 - Integrate Cubit with Layout'),
                  onPressed: () => Navigator.pushNamed(context, '/todo-3'),
                ),
              ],
            ),
          ),
        ),
      ),
      routes: {
        '/vanilla': (context) => VanillaCounterPage(),
        '/provider': (context) => ProviderCounterPage(),
        '/cubit': (context) => CubitCounterPage(),
        '/todo-1': (context) => TodoAppLayout(),
        '/todo-3': (context) => TodoPage(),
      },
    );
  }
}
