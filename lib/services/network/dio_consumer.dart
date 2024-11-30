// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class DioConsumer {
  final Dio dio;

  DioConsumer({
    required this.dio,
  });

  Future get(
      String path, Object data, Map<String, dynamic> queryParameters) async {
    dio.options
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request: ${options.method} ${options.path}');
        return handler.next(options); // Continue
      },
      onResponse: (response, handler) {
        print('Response: ${response.statusCode}');
        return handler.next(response); // Continue
      },
      onError: (DioException e, handler) {
        print('Error: ${e.message}');
        return handler.next(e); // Continue
      },
    ));
  }
}

void fetchData() async {
  final Dio dio = Dio();

  try {
    // Make a GET request
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');

    // Handle the response
    if (response.statusCode == 200) {
      print('Data fetched successfully: ${response.data}');
    } else {
      print('Unexpected status code: ${response.statusCode}');
    }
  } on DioException catch (e) {
    // Handle Dio-specific exceptions
    if (e.type == DioExceptionType.connectionTimeout) {
      print('Connection timeout');
    } else if (e.type == DioExceptionType.sendTimeout) {
      print('Send timeout');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      print('Receive timeout');
    } else if (e.type == DioExceptionType.badResponse) {
      print('Bad response: ${e.response?.statusCode} - ${e.response?.data}');
    } else if (e.type == DioExceptionType.cancel) {
      print('Request canceled');
    } else {
      print('Unexpected error: ${e.message}');
    }
  } catch (e) {
    // Handle general exceptions
    print('Unexpected error: $e');
  }
}

String handleHttpError(Response? response) {
  switch (response?.statusCode) {
    case 400:
      return 'Bad request. Please check your input.';
    case 401:
      return 'Unauthorized. Please login again.';
    case 404:
      return 'Resource not found.';
    case 500:
      return 'Server error. Please try again later.';
    default:
      return 'Unexpected error occurred.';
  }
}

Future<void> fetchWithRetry(Dio dio, String url, {int retries = 3}) async {
  for (int attempt = 0; attempt < retries; attempt++) {
    try {
      final response = await dio.get(url);
      print('Data fetched: ${response.data}');
      return; // Exit loop if successful
    } catch (e) {
      print('Attempt ${attempt + 1} failed: $e');
      if (attempt == retries - 1) {
        rethrow; // Rethrow if all retries fail
      }
      await Future.delayed(const Duration(seconds: 2)); // Wait before retrying
    }
  }
}
