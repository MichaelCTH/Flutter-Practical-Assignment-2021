library request_service;

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/material.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'interceptors.dart';

class RequestService extends DioForNative {
  static final navigatorKey = GlobalKey<NavigatorState>();

  RequestService([BaseOptions options]) : super(options) {
    super.interceptors.add(PrettyDioLogger());
    super.interceptors.add(ErrorInterceptor());
  }
}

RequestService setupMock(RequestService client) {
  const mocked = <Map<String, dynamic>>[
    {'id': 1, 'title': 'News 1', 'content': 'News Content 1'},
    // {'id': 2, 'title': 'News 2', 'content': 'News Content 2'},
    {'id': 3, 'title': 'News 3', 'content': 'News Content 3'},
  ];

  final adapter = DioAdapter()
    ..onGet('/news', (request) => request.reply(200, mocked))
    ..onGet('/news/1', (request) => request.reply(200, mocked.first))
    ..onGet('/news/2', (request) => request.reply(404, null))
    ..onGet('/news/3', (request) => request.reply(200, mocked.last));

  client.httpClientAdapter = adapter;
  return client;
}
