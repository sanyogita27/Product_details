import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginform/form/bloc/user_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
