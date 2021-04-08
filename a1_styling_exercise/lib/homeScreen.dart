import "package:flutter/material.dart";

import 'routes.dart';

class HomeScreen extends StatelessWidget {
  final _pages = Routes.pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Assignment 1')),
      body: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
        children: List.generate(
          _pages.length,
          (index) => ListItem(_pages[index][0], _pages[index][1]),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String _title;
  final String _routeName;

  ListItem(this._title, this._routeName);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListTile(
            title: Text(_title),
            onTap: () => Navigator.pushNamed(context, _routeName),
          ),
        ),
        Divider(),
      ],
    );
  }
}
