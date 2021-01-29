import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ceria_app/model/user-model.dart';
import 'package:ceria_app/repo/api-repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if(event is AuthLogin){
      yield* authLogin(event.phoneNumber, event.password);
    }
  }

  Stream<AuthState> authLogin(String phoneNumber, String password) async*{
    ApiRepository apiRepository = ApiRepository();
    yield AuthLoading();
    try{
      UserModel userModel = await apiRepository.login(phoneNumber, password);
      yield AuthSuccess(userModel: userModel);
    }catch (e){
      yield AuthFailed(errMessage: e.toString());
    }
  }
}
