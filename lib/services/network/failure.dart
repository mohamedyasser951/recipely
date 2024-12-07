abstract class Failure {
  final String message;
  final int? errorCode;

  Failure({required this.message, this.errorCode});
}

class NetworkFailure extends Failure {
  NetworkFailure({super.message = "No internet connection", super.errorCode});
}

class ServerFailure extends Failure {
  ServerFailure({super.message = "Server error occurred", super.errorCode});
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({super.message = "Unauthorized access", super.errorCode});
}

class TimeoutFailure extends Failure {
  TimeoutFailure({super.message = "Request timed out", super.errorCode});
}

class BadRequestFailure extends Failure {
  BadRequestFailure({super.message = "Bad request", super.errorCode});
}

class NotFoundFailure extends Failure {
  NotFoundFailure({super.message = "Resource not found", super.errorCode});
}
