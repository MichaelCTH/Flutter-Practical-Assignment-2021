import 'package:flutter/material.dart';

import 'pages/cubit_page.dart';
import 'pages/provider_page.dart';
import 'pages/todo_page.dart';
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
                  child: Text('Todo App'),
                  onPressed: () => Navigator.pushNamed(context, '/todo'),
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
        '/todo': (context) => TodoPage(),
      },
    );
  }
}
