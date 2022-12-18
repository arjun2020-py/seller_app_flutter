part of 'siginup_auth_bloc.dart';

@immutable
abstract class SiginupAuthState {}

class SiginupAuthInitial extends SiginupAuthState {}

class SiginupSucess extends SiginupAuthState {}

class SiginupFailed extends SiginupAuthState {
  SiginupFailed({required this.errorMessgae});

  String errorMessgae;
}
