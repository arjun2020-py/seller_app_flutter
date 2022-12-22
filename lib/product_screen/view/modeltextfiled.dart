import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class modelTextfield extends StatelessWidget {
  modelTextfield({
    required this.buttonType,
    this.proname,
    this.prodesc,
    this.proPrice,
    this.Id,
    Key? key,
  }) : super(key: key);
  late TextEditingController productnameControler =
          TextEditingController(text: proname),
      productDcrptionControler = TextEditingController(text: prodesc),
      productpriceController = TextEditingController(text: proPrice);

  String? Id;
  bool buttonType;
  String? proname;
  String? prodesc;
  String? proPrice;
  final proRef = FirebaseFirestore.instance.collection('Product_collection');
  final _auth = FirebaseAuth.instance;
  XFile? image;

  // Future<dynamic> getImage() async {
  //   final imagePicker = ImagePicker();
  //   print('sdfdfgnbsdfihbsdfkjhbsdfgsdfgsdfgsdf---------------------------');
  //   try {
  //     image = await imagePicker.pickImage(source: ImageSource.gallery);
  //     print('${image!.path} ================================');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 300,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Update Product Here",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              // TextButton(onPressed: getImage, child: const Text('Upload pic')),
              TextFormField(
                controller: productnameControler,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter product title',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productDcrptionControler,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter product dicrption',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productpriceController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter product price',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    
                      updateProduct(
                          proName: productnameControler.text,
                          proDec: productDcrptionControler.text,
                          proPrice: productpriceController.text);
                      Navigator.pop(context);
                    },
                  
                  child: Text( "Update")),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(
      {required String proName,
      required String proDec,
      required String proPrice}) async {
    try {
      await proRef.doc(Id).update({
        'proName': proName,
        'proDecrption': proDec,
        'proPrice': proPrice,
        'proImage': ''
      });
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> deleteProduct() async {
  //   try {
  //     await proRef.doc(Id).delete();s
  //   } catch (e) {}
  // }

//get image from gallery.

  // Future<String> updateProductImage(XFile image) async {
  //   final refernce =
  //       FirebaseStorage.instance.ref().child('proImage').child(image.name);

  //   final file = File(image.path);
  //   await refernce.putFile(file);

  //   final imagelink = await refernce.getDownloadURL();
  //   print(imagelink);
  //   // print(imagelink);
  //   return imagelink;
  // }
}