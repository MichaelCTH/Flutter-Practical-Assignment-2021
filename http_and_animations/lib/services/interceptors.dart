part of request_service;

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

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  Future onError(DioError err) async {
    // Handle error here.
    // 404, 500 or socket error
    // Use logger?
    // Just print it out Or use Cloudwatch to report errors
    if (err.response.statusCode == 404) {
      // You can integrate with your package
      // Such as show a toast
      // Or show a popup
      if (RequestService.navigatorKey.currentState != null) {
        showAboutDialog(
          context: RequestService.navigatorKey.currentState.context,
          children: [Text(err.error)],
        );
      }
    }
    return super.onError(err);
  }
}
