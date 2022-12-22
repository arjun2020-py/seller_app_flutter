import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seller/product_screen/bloc/add_product_bloc.dart';
import 'package:seller/product_screen/view/product_screen.dart';
import 'package:uuid/uuid.dart';

class AddProduct extends StatelessWidget {
  AddProduct({
    super.key,
  });

  final proRef = FirebaseFirestore.instance.collection('Product_collection');
  final _auth = FirebaseAuth.instance;
  //1
  late final XFile? image;

//2
  Future<XFile?> getImage() async {
    print('=============================================================');
    final imagePicker = ImagePicker();

    image = await imagePicker.pickImage(source: ImageSource.gallery);
    print('-------------------------------------------------${image!.name}');
  }

  TextEditingController productNameController = TextEditingController(),
      productDecrptionController = TextEditingController(),
      productPriceController = TextEditingController();

  //create a object for bloc
  AddProductBloc _addProdct = AddProductBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _addProdct,
      child: BlocListener<AddProductBloc, AddProductState>(
        listener: (context, state) {
          if (state is ProductAddedSucess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Sucessfully added')));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TrendingProduct(),
            ));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('failed to add prodcut')));
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xff472183),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrendingProduct(),
                      ));
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xffF1F6F5),
                )),
            title: const Center(
              child: Text(
                'Add Products',
                style: TextStyle(color: Color(0xffF1F6F5)),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Color(0xffF1F6F5),
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Column(
                      children: [
                        const Text('Add Product Here',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        const SizedBox(height: 10),
                        TextButton(
                            onPressed: getImage, child: Text('Upload pic')),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: productNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter product title',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: productDecrptionController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter product dicrption',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: productPriceController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter product price',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                           
                            onPressed: () {
                              _addProdct.add(
                                ProductAddEvent(
                                    proName: productNameController.text,
                                    proDec: productDecrptionController.text,
                                    proPrice: double.parse(
                                        productPriceController.text),
                                    image: image!),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff4B56D2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                side: const BorderSide(
                                    width: 3, color: Color(0xff82C3EC))),
                            child: const Text(
                                // (buttonType) ?
                                "Add"
                                // : "Update"
                                ),
                          ),
                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

//3
  // Future<void> createProduct({
  //   required String proName,
  //   required String proDec,
  //   required String proPrice,
  //   required XFile? image,
  // }) async {
  //   print(
  //       '===============++++++++++++++++++++++++=======================${image!.name}');
  //   //4

  //   final auth = FirebaseAuth.instance;
  //   final refernce =
  //       FirebaseStorage.instance.ref().child('proImage').child(image.name);

  //   final file = File(image.path);
  //   await refernce.putFile(file);

  //   final imagelink = await refernce.getDownloadURL();
  //   final userId = auth.currentUser!.uid;
  //   var uuid = const Uuid();
  //   var proId = uuid.v4();

  //   //5

  //   try {
  //     await proRef.doc(proId).set({
  //       'proName': proName,
  //       'proDecrption': proDec,
  //       'proPrice': proPrice,
  //       "userid": userId,
  //       'proId': proId,
  //       "proImage": imagelink
  //     });
  //   } catch (e) {}
  // }
}

// proName': proName,
//         'proDecrption': proDecrption,
//         'proPrice': proPrice,
//         "userid": userId,
//         'proId': proId,
//         "proImage": imagelink,

// if (buttonType) {
//   FirbaseCrud().CreateProdcut(
//       image: image,
//       proName: productnameControler.text,
//       proDecrption: productDcrptionControler.text,
//       proPrice: productpriceController.text);

//   Navigator.pop(context);
// } else {
//   updateProduct(
//       proName: productnameControler.text,
//       proDec: productDcrptionControler.text,
//       proPrice: productpriceController.text);
//   Navigator.pop(context);
// }