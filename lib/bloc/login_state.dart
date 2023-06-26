import 'package:loginform/bloc/submission_status.dart';

class LoginState {
  final String? username;
  final String? password;
  final SubmissionStatus formStatus;
  LoginState(
      {this.username,
      this.password,
      this.formStatus = const InitialSubmissionStatus()});
  LoginState copyWith({
    String? username,
    String? password,
    SubmissionStatus? formStatus,
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}

class LoginInitial extends LoginState {
  LoginInitial()
      : super(
          username: "",
          password: "",
          formStatus: InitialSubmissionStatus(),
        );
}
