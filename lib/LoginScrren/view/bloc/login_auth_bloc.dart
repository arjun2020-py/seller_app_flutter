// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../shredPrefrences/shared_pref.dart';

part 'login_auth_event.dart';
part 'login_auth_state.dart';

class LoginAuthBloc extends Bloc<LoginAuthEvent, LoginAuthState> {
  LoginAuthBloc() : super(LoginAuthInitial()) {
    on<LoginAuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        final auth = FirebaseAuth.instance;

        try {
          await auth.signInWithEmailAndPassword(
              email: event.email, password: event.passwrod);

          //2 shred preffrces code
          await ShredPref().setUserData(event.email, auth.currentUser!.uid);

          emit(LoginSucess());
        } on FirebaseAuthException catch (e) {
          emit(LoginFailed(message: e.code));
        }
      }
      // TODO: implement event handler
    });
  }
}
