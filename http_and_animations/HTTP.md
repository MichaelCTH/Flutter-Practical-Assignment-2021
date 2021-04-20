# HTTP & Animations

## HTTP

### Using native HTTP client

[https://flutter.dev/docs/cookbook/networking/fetch-data](https://flutter.dev/docs/cookbook/networking/fetch-data)

#### Basic usage

 ```dart
 // Prepare HTTP client
 final client = HttpClient();
 
 // Send a GET request
 final request = await client.getUrl(Uri(path: 'https://example.com'));
 // Add request header
 request.headers.add("user-agent", "test");
 // Send request and get response
 final response = await request.close();
 
 // Send a POST request
 final request = await http.postUrl(Uri(path: 'https://example.com'));
 // Add POST body
 request.add(utf8.encode('...'));
 final response = await request.close();
 
 
 // ... Other method like PUT, DELETE and so on. 
 ```



### Use Dio

#### Introduction

A powerful Http client for Dart, which supports **Interceptors**, Global configuration, FormData, Request Cancellation, **File downloading**, **Timeout** etc.

[https://pub.dev/packages/dio](https://pub.dev/packages/dio)

#### Basic usage

 ```dart
 // Prepare HTTP client
 final client = Dio();
 
 // Send a GET request
 final response = await client.get('https://example.com');
 // With query parameters -> GET https://example.com?foo=bar
 client.get('https://example.com', queryParameters: {'foo': 'bar'});
 // With extra header
 client.get('https://example.com', options: Options(headers: {'user-agent': 'test'}));
 
 // Send a POST request
 final response = await client.post(
   'https://example.com',
   data: {'foo': 'bar'},
 );
 
 // ... Other method like PUT, DELETE and so on. 
 ```


#### **How to convert response data to data model?**

You need to implement `fromJson` method in your data model.

 ```dart
 import 'package:equatable/equatable.dart';
 
 class NewsModel extends Equatable {
   final int id;
   final String title;
   final String content;
 
   const NewsModel({this.id, this.title, this.content});
 
   factory NewsModel.fromJson(Map<String, dynamic> json) {
     return NewsModel(
       id: json['id'] as int,
       title: json['title'] as String,
       content: json['content'] as String,
     );
   }
 
   @override
   List<Object> get props => [id, title, content];
 } 
 ```


And use it when getting response.

 ```dart
 final client = RequestService();
 
 final response = client.get<List>('/news');
 
 // data is an instance of List<NewsModel>
 final data = List<NewsModel>.from(
   response.data.map((each) => NewsModel.fromJson(each)),
 ); 
 ```


#### **How to write an interceptor?**

Implement a class that extends from `InterceptorWrapper`

 ```dart
 import 'package:dio/dio.dart';
 
 class CustomInterceptors extends Interceptor {
   @override
   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
     print('REQUEST[${options.method}] => PATH: ${options.path}');
     return super.onRequest(options, handler);
   }
   @override
   Future onResponse(Response response, ResponseInterceptorHandler handler) {
     print('RESPONSE[${response.statusCode}] => PATH: ${response.request?.path}');
     return super.onResponse(response, handler);
   }
   @override
   Future onError(DioError err, ErrorInterceptorHandler handler) {
     print('ERROR[${err.response?.statusCode}] => PATH: ${err.request.path}');
     return super.onError(err, handler);
   }
 }
 ```


**Interceptor example**

 ```dart
 // Implement login token interceptor
 class TokenInterceptor extends InterceptorsWrapper {
   @override
   Future onRequest(RequestOptions options) {
     // Get your token from shared preference
     // And attach it to your each API request
     final token = 'MOCK_TOKEN';
     options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
     return super.onRequest(options);
   }
 }
 ```


#### **How to mock HTTP request?**

use package `http_mock_adapter`

 ```dart
 // Define your client
 final client = Dio();
 
 // Define your adapter
 final adapter = DioAdapter();
 
 // Prepare mocked data
 final data = [
   {'id': 1, 'title': 'News 1', 'content': 'News Content 1'},
 ];
 
 // Configure the behavior of adapter
 adapter.onGet('https://example.com/news', (request) {
   request.reply(200, data);
 });
 
 // Connect adapter with your client
 client.httpClientAdapter = adapter;
 
 ```


See `test/request_test.dart` for more information.

#### **How to handle HTTP errors?**

1. Use error interceptor

 ```dart
 class ErrorInterceptor extends InterceptorsWrapper {
   @override
   Future onError(DioError err) async {
     // Handle error here.
     // 404, 500 or socket error
     // Use logger?
     // Just print it out Or use Cloudwatch to report errors
     return super.onError(err);
   }
 }
 ```


2. Use `try ... catch`

 ```dart
 // Following code block should be put into an async function
 // client is an instance of Dio
 try {
   await client.get('/news/2');
 } on DioError catch(error) {
   // do something
 }
 
 ```


