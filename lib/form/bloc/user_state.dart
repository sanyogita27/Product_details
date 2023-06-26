part of 'user_bloc.dart';
// enum Status{
//   success,
//   error,
  
// }
abstract class UserState extends Equatable {
  final UsersModel usersModel;
  
  UserState({required this.usersModel});
}

class UserStateImpl extends UserState {
  UserStateImpl({required super.usersModel});
  UserStateImpl copyWith({UsersModel? usersModel}) {
    return UserStateImpl(usersModel: usersModel ?? this.usersModel);
    
  }
}

class UserInitial extends UserStateImpl {
  UserInitial() : super(usersModel: UsersModel());
}


