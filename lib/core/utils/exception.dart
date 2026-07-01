abstract class ApiException implements Exception {
  final String message;
  ApiException(this.message);
}

class ServerException extends ApiException {
  ServerException(String message) : super(message);
}

class NoInternetException extends ApiException {
  NoInternetException() : super('No internet connection');
}

class NotFoundException extends ApiException {
  NotFoundException(String message) : super(message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException() : super('Unauthorized access');
}

class CacheException extends ApiException {
  CacheException(String message) : super(message);
}

abstract class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class DataException extends AppException {
  DataException(String message) : super(message);
}