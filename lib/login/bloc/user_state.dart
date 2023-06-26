part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final Failure failure;
  UserState({required this.failure});
}

class UserStateImpl extends UserState {
  UserStateImpl({required super.failure});
  UserStateImpl copyWith({Failure? failure}) {
    return UserStateImpl(failure: failure ?? this.failure);
  }
  
  @override
  
  List<Object?> get props => [failure];

}

class UserInitial extends UserStateImpl {
  UserInitial() : super(failure: Failure());
}

class Failure {
  int statusCode;
  String message;
  dynamic errorData;
  bool? status;

  Failure({
    this.statusCode = 100,
    this.message = "",
    this.errorData,
    this.status,
  });
}
