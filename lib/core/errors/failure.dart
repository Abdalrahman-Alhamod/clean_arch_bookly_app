import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('bad certificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request was canceled with api server');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internert connection');
      case DioExceptionType.unknown:
        return ServerFailure('oops there was an error');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with the server');
    } else if (statusCode == 401) {
      return ServerFailure('Your are not authorized');
    } else if (statusCode == 403) {
      return ServerFailure('Your are forbidden');
    } else if (statusCode == 400) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('oops there was an error');
    }
  }
}
