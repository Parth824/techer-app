import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tech_lancer_teacher/app/data/networks/error_handler.dart';
import 'auth_interceptor2.dart';

abstract class _BaseApiController {
  late Dio _dio;
  NetworkInfo networkInfo = NetworkInfo();
  String ipv4 = '';

  void init() async {
    
    // ipv4 = "192.168.85.205";
    
    // String base = 'http://3.7.65.152/teach-lancer/';
    // String base = 'https://teach-lancer.onrender.com/';
      String base = "http://3.7.145.66/teach-lancer/";
    
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      baseUrl: base,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        HttpHeaders.acceptHeader: Headers.jsonContentType,
      },
    );

    _dio = Dio(dioOptions);
    _setupInterceptors();
  }

  // Add Auth Interceptor
  void _setupInterceptors() {
    _dio.interceptors.add(AuthInterceptor2());
    _dio.interceptors.add(
      PrettyDioLogger(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }

  // GET
  Future<Response> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: query,
    );
    return response;
  }

  // POST
  Future<Response> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: query,
    );
    return response;
  }

  // POST with File
  Future<Map<String, dynamic>> postWithFile({
    required String path,
    required FormData data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  // PUT
  Future<Map<String, dynamic>> put({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  // PATCH
  Future<Map<String, dynamic>> patch({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: query,
      );

      return response.data;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  // DELETE
  Future<Map<String, dynamic>?> delete({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  // Upload File
  Future<void> uploadFile(String path, File file) async {
    try {
      var len = await file.length();
      await Dio().put(
        path,
        data: file.openRead(),
        options: Options(
          headers: {
            Headers.contentLengthHeader: len, // set content-length
          },
        ),
      );
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}

class ApiController2 extends _BaseApiController {
  ApiController2() {
    super.init();
  }
}

