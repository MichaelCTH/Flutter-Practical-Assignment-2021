import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../lib/models/news.dart';
import '../lib/services/request.dart';

const baseURL = 'https://example.com';
const mocked = <Map<String, dynamic>>[
  {'id': 1, 'title': 'News 1', 'content': 'News Content 1'},
  // {'id': 2, 'title': 'News 2', 'content': 'News Content 2'},
  {'id': 3, 'title': 'News 3', 'content': 'News Content 3'},
];
void main() async {
  RequestService client;
  DioAdapter adapter;

  setUpAll(() {
    adapter = DioAdapter();
    adapter.onGet('/news', (request) => request.reply(200, mocked));
    adapter.onGet('/news/1', (request) => request.reply(200, mocked.first));
    adapter.onGet('/news/2', (request) => request.reply(404, null));
    adapter.onGet('/news/3', (request) => request.reply(200, mocked.last));
  });

  setUp(() {
    client = RequestService(BaseOptions(baseUrl: baseURL));
    client.httpClientAdapter = adapter;
  });

  test('It should get a List of data correctly', () async {
    final response = await client.get<List>('/news');
    final data = List<NewsModel>.from(
      response.data.map((each) => NewsModel.fromJson(each)),
    );

    expect(data, [
      NewsModel(id: 1, title: 'News 1', content: 'News Content 1'),
      NewsModel(id: 3, title: 'News 3', content: 'News Content 3'),
    ]);
  });

  test('It should get a single data correctly', () async {
    final response = await client.get<Map<String, dynamic>>('/news/1');
    final data = NewsModel.fromJson(response.data);

    expect(data, NewsModel(id: 1, title: 'News 1', content: 'News Content 1'));
  });

  test('It should handle 404 error correctly', () async {
    try {
      await client.get<Map<String, dynamic>>('/news/2');
    } on DioError catch (error) {
      expect(error.error, 'Http status error [404]');
    }
  });
}
