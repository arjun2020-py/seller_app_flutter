part of 'siginup_auth_bloc.dart';

@immutable
abstract class SiginupAuthEvent {}

class SiginupEvent extends SiginupAuthEvent {
  SiginupEvent({
    required this.userName,
    required this.email,
    required this.mobilNo,
    required this.passwrod,
    required this.confromPass,
    // required this.image
  });

  String userName;
  String email;
  String mobilNo;
  String passwrod;
  String confromPass;
  // XFile image;
}
