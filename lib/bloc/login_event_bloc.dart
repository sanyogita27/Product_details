abstract class LoginEvent {}
class LoginInitialEvent extends LoginEvent{}

class InputUserNameEvent extends LoginEvent {
  final String username;

  InputUserNameEvent({required this.username});
}

class InputPasswordEvent extends LoginEvent {
  final String password;

  InputPasswordEvent({required this.password});
}




class LoginLoadingEvent extends LoginEvent {}
class LoggedInEvent extends LoginEvent{}






