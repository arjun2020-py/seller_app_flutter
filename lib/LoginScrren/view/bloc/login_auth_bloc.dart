// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

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

          emit(LoginSucess());
        } on FirebaseAuthException catch (e) {
          emit(LoginFailed(message: e.code));
        }
      }
      // TODO: implement event handler
    });
  }
}

 // onPressed: () async {
                          //   validateTextfiled();

                          //   final auth = FirebaseAuth.instance;
                          //   try {
                          //     await auth.signInWithEmailAndPassword(
                          //         email: emailController.text,
                          //         password: passwrodController.text);

                          //     //ignore: use_build_context_synchronously
                          //     Navigator.of(context).pushNamed("Home");
                          //   } on FirebaseAuthException catch (e) {
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(content: Text(e.code)));
                          //     print(e.code);
                          //   }
                          // },
