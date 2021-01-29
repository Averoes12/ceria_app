part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel userModel;
  AuthSuccess({@required this.userModel});
}

class AuthFailed extends AuthState {
  final String errMessage;
  AuthFailed({@required this.errMessage});
}

class AuthLoading extends AuthState {}
