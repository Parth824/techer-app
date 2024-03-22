import 'dart:io';
import 'package:dio/dio.dart';

class AuthInterceptor2 extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWM0YjEzZDJmZDRlMGNmYTc2YjA5NjAiLCJpYXQiOjE3MDc5NzU4NDd9.-2Zi4j9A5pIWSiR-d3iP-za1VMmh4WeNTnqhj-kprYg";
    options.headers[HttpHeaders.authorizationHeader] = token;
      handler.next(options);
  }
}
