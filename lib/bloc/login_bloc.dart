import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginform/bloc/login_event_bloc.dart';
import 'package:loginform/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<InputUserNameEvent>(
      (event, emit) => emit(LoginInitial()),
    );
    on<InputPasswordEvent>((event, emit) => emit(state.copyWith(password: event.password,
    )));

  }
}
