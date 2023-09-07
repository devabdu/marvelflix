import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool successMessage;
  final int statusCode;
  final String statusMessage;

  const ErrorMessageModel({
    required this.successMessage,
    required this.statusCode,
    required this.statusMessage,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        successMessage: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
      );

  @override
  List<Object?> get props => [
        successMessage,
        statusCode,
        statusMessage,
      ];
}
