import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_and_animations/models/news.dart';
import 'package:http_and_animations/services/request.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RequestService.navigatorKey,
      title: 'HTTP & Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

const baseURL = 'https://example.com';

class HomePage extends StatelessWidget {
  final client = setupMock(RequestService(BaseOptions(baseUrl: baseURL)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HTTP & Animation')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Trigger 404'),
              onPressed: () => client.get('/news/2'),
            ),
            Builder(builder: (context) {
              return ElevatedButton(
                child: Text('Get a list of News data'),
                onPressed: () {
                  client.get<List>('/news').then((response) {
                    final data = List<NewsModel>.from(
                      response.data.map((json) => NewsModel.fromJson(json)),
                    );

                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(data.map((each) => each.id).join(' ')),
                      ),
                    );
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
