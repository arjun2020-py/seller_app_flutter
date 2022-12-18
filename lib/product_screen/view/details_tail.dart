import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seller/product_screen/view/modeltextfiled.dart';
import 'package:uuid/uuid.dart';

class DeatilsTil extends StatelessWidget {
  DeatilsTil({Key? key, required this.productData}) : super(key: key);

  var productData;

  final proRef = FirebaseFirestore.instance.collection('Product_collection');

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: (productData['proImage'] == '')
            ? Image.network(
                'https://www.alphapolymers.in/images/default_product.png',
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : Image.network(
                productData['proImage'].toString(),
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
        // height: 170,
        // width: double.infinity,
        // fit: BoxFit.cover,

        subtitle: Column(
          children: [
            Text(productData['proName']),
            Text(productData['proDecrption']),
            Text(productData['proPrice']),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Icon(Icons.update_outlined),
                        TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return modelTextfield(
                                    buttonType: false,
                                    proname: productData['proName'].toString(),
                                    prodesc:
                                        productData['proDecrption'].toString(),
                                    proPrice:
                                        productData['proPrice'].toString(),
                                    Id: productData['proId'].toString(),
                                  );
                                },
                              );
                            },
                            child: const Text('Update')),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Icon(Icons.delete_outlined),
                        TextButton(
                            onPressed: () {
                              deleteProduct(productData['proId'].toString());
                              Navigator.pop(context);
                            },
                            child: const Text('Delete')),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Future<void> updateProduct({required String proName,required String proDecs,required String proPrice}) async {
  //   final auth = FirebaseAuth.instance;
  //   final userId = auth.currentUser!.uid;
  //   var uuid = const Uuid();
  //   var proId = uuid.v4();
  //   try {
  //     await proRef.doc(proId).update({
  //       'proName':proName,s
  //       'proDecrption':proDecs,
  //       'proPrice':proPrice
  //     });
  //   } catch (e) {}
  // }

  Future<void> deleteProduct(String id) async {
    final proRef = FirebaseFirestore.instance.collection('Product_collection');

    try {
      await proRef.doc(id).delete();
    } catch (e) {}
  }
}
