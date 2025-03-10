import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server error occurred'])
      : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([String message = 'Connection error occurred'])
      : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure([String message = 'Database error occurred'])
      : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure([String message = 'Cache error occurred'])
      : super(message);
}

class NoDataFailure extends Failure {
  const NoDataFailure([String message = 'No data available']) : super(message);
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure([String message = 'User not found'])
      : super(message);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure([String message = 'Bad request']) : super(message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure([String message = 'An unexpected error occurred'])
      : super(message);
}

class ValidationFailure extends Failure {
  final List<String> errors;

  ValidationFailure(this.errors)
      : super(errors.isNotEmpty
            ? errors.join(', ')
            : 'Validation error occurred');
}
