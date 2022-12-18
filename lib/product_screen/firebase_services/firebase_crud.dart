// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

// class FirbaseCrud {
//   Future<void> CreateProdcut(
//       {required XFile? image,
//       required String proName,
//       required String proDecrption,
//       required String proPrice}) async {
//     print('==================================');
//     print(image!.name);
//     final proRef = FirebaseFirestore.instance.collection('Product_collection');
//     final auth = FirebaseAuth.instance;
//     final userId = auth.currentUser!.uid;
//     var uuid = const Uuid();
//     var proId = uuid.v4();

//     final refernce =
//         FirebaseStorage.instance.ref().child('proImage').child(image.name);

//     final file = File(image.path);
//     await refernce.putFile(file);

//     final imagelink = await refernce.getDownloadURL();
//     print(imagelink);

//     try {
//       await proRef.doc(proId).set({
//         'proName': proName,
//         'proDecrption': proDecrption,
//         'proPrice': proPrice,
//         "userid": userId,
//         'proId': proId,
//         "proImage": imagelink,
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
