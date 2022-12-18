import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'siginup_auth_event.dart';
part 'siginup_auth_state.dart';

class SiginupAuthBloc extends Bloc<SiginupAuthEvent, SiginupAuthState> {
  SiginupAuthBloc() : super(SiginupAuthInitial()) {
    on<SiginupAuthEvent>((event, emit) async {
      if (event is SiginupEvent) {
        final auth = FirebaseAuth.instance;
        final userRef = FirebaseFirestore.instance.collection('Users');

        try {
          await auth.createUserWithEmailAndPassword(
              email: event.email, password: event.passwrod);

          await userRef.doc(auth.currentUser!.uid).set({
            'userid': auth.currentUser!.uid,
            'userName': event.userName,
            'email': event.email,
            'mobil': event.mobilNo,
            'passwrod': event.passwrod,
            'profileImage': event.confromPass,
            'profileImage': '',
          });
          emit(SiginupSucess());
        } on FirebaseAuthException catch (e) {
          emit(SiginupFailed(errorMessgae: e.code));
        }
      }
      // TODO: implement event handler
    });
  }
}
