part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLogin extends AuthEvent{
  final String phoneNumber, password;

  AuthLogin({@required this.phoneNumber,@required this.password});
}