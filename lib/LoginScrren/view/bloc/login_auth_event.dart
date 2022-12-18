part of 'login_auth_bloc.dart';

@immutable
abstract class LoginAuthEvent {}

class LoginEvent extends LoginAuthEvent {
  LoginEvent({required this.email, required this.passwrod});
  String email;
  String passwrod;
}
