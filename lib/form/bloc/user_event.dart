part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {
  final int id;
  GetUserEvent({required this.id});
}
