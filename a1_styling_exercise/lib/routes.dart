import 'homeScreen.dart';
import 'pages/exercise1.dart';
import 'pages/exercise2.dart';
import 'pages/exercise3.dart';
import 'pages/exercise4.dart';
import 'pages/exercise5.dart';
import 'pages/exercise6.dart';

class Routes {
  static final _routes = {
    '/': (context) => HomeScreen(),
    Exercise1.routeName: (context) => Exercise1(),
    Exercise2.routeName: (context) => Exercise2(),
    Exercise3.routeName: (context) => Exercise3(),
    Exercise4.routeName: (context) => Exercise4(),
    Exercise5.routeName: (context) => Exercise5(),
    Exercise6.routeName: (context) => Exercise6(),
  };

  static get routes => _routes;

  static final _pages = [
    [Exercise1.title, Exercise1.routeName],
    [Exercise2.title, Exercise2.routeName],
    [Exercise3.title, Exercise3.routeName],
    [Exercise4.title, Exercise4.routeName],
    [Exercise5.title, Exercise5.routeName],
    [Exercise6.title, Exercise6.routeName],
  ];

  static get pages => _pages;
}
