part of 'login_auth_bloc.dart';

@immutable
abstract class LoginAuthState {}

class LoginAuthInitial extends LoginAuthState {}

class LoginSucess extends LoginAuthState {}

class LoginFailed extends LoginAuthState {
  LoginFailed({required this.message});
  String message;
}
