import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure();

  @override
  List<Object> get props => [];
}

class ApiError extends Failure {
  final String? message;
  ApiError({this.message}) : super();
}