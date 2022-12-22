import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitial()) {
    on<AddProductEvent>((event, emit) async {
      //1
      if (event is ProductAddEvent) {
        try {
          final auth = FirebaseAuth.instance;
          final proRef =
              FirebaseFirestore.instance.collection('Product_collection');

          final userId = auth.currentUser!.uid;
          var uuid = const Uuid();
          var proId = uuid.v4();

          final refernce = FirebaseStorage.instance
              .ref()
              .child('proImage')
              .child(event.image.name);

          final file = File(event.image.path);
          await refernce.putFile(file);
          final imagelink = await refernce.getDownloadURL();

          await proRef.doc(proId).set({
            'proName': event.proName,
            'proDecrption': event.proDec,
            'proPrice': event.proPrice,
            "userid": userId,
            'proId': proId,
            "proImage": imagelink
          });
          emit(ProductAddedSucess());
        } catch (e) {
          emit(ProductAddedFiled());
        }
      }

      //2
      if (event is DeleteProductEvent) {
        try {
          final proRef =
              FirebaseFirestore.instance.collection('Product_collection');

          await proRef.doc(event.proId).delete();
        } catch (e) {}
      }
      //3
      // if (event is UpdateProductEvent) {

      // }

      void onTransition(
          Transition<AddProductEvent, AddProductState> transition) {
        super.onTransition(transition);
      }

      onTransition(
          Transition(currentState: this.state, event: event, nextState: state));
    });
  }
}
