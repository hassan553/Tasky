// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseMessage {
  final String message;
  final bool status;
  ResponseMessage({
    required this.message,
    required this.status,
  });

  factory ResponseMessage.fromMap(Map<String, dynamic> map) {
    return ResponseMessage(
      message: map['message'],
      status: map['status'],
    );
  }

  factory ResponseMessage.fromJson(String source) =>
      ResponseMessage.fromMap(json.decode(source) as Map<String, dynamic>);
}
