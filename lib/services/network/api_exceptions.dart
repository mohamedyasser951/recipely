import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  @override
  String toString() => message;

  static String handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timed out. Please check your internet connection.";
      case DioExceptionType.receiveTimeout:
        return "Server took too long to respond. Try again later.";
      case DioExceptionType.sendTimeout:
        return "Request timed out. Please try again.";
      case DioExceptionType.badResponse:
        if (error.response != null && error.response!.statusCode != null) {
          switch (error.response!.statusCode) {
            case 400:
              return "Bad request. Please try again.";
            case 401:
              return "Unauthorized. Please log in again.";
            case 403:
              return "Access denied. You don't have permission.";
            case 404:
              return "Resource not found. Please check the input.";
            case 500:
              return "Internal server error. Try again later.";
            default:
              return "Unexpected error occurred: ${error.response!.statusCode}";
          }
        }
        return "Unexpected response format.";
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.unknown:
        return "An unexpected error occurred. Please check your connection.";
      default:
        return "An unknown error occurred.";
    }
  }
}
