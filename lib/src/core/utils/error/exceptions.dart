import 'package:marvelflix/src/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({
    required this.errorMessageModel,
  });
}

class LocalDatabaseException implements Exception {
  final String errorMessage;

  LocalDatabaseException({
    required this.errorMessage,
  });
}
