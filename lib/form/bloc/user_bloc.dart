import 'package:bloc/bloc.dart';
import 'package:loginform/form/model/user_model.dart';
import 'package:loginform/form/repo/user_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserStateImpl> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});
    on<GetUserEvent>((event, emit) async {
      emit(state.copyWith());
    
      
    });
  }
}
