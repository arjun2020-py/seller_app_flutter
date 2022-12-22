import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seller/product_screen/bloc/add_product_bloc.dart';
import 'package:seller/product_screen/view/modeltextfiled.dart';
import 'package:seller/product_screen/view/product_screen.dart';
import 'package:uuid/uuid.dart';

class DeatilsTil extends StatelessWidget {
  DeatilsTil({Key? key, required this.productData}) : super(key: key);

  var productData;

  final proRef = FirebaseFirestore.instance.collection('Product_collection');

  final _proBloc = AddProductBloc();

  TextEditingController productnameControler = TextEditingController(),
      productDcrptionControler = TextEditingController(),
      productpriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _proBloc,
      child: BlocListener<AddProductBloc, AddProductState>(
        listener: (context, state) {
          if (state is ProductDeleteSucess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Delete Sucess')));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TrendingProduct(),
            ));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Delete failed')));
          }
        },
        child: Card(
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
                const SizedBox(
                  height: 10,
                ),
                Text(productData['proName']),
                const SizedBox(
                  height: 10,
                ),
                Text(productData['proDecrption']),
                Text(productData['proPrice'].toString()),
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
                                        proname:
                                            productData['proName'].toString(),
                                        prodesc: productData['proDecrption']
                                            .toString(),
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
                                  _proBloc.add(DeleteProductEvent(
                                      proId: productData['proId'].toString()));
                                  // deleteProduct(productData['proId'].toString());
                                  // Navigator.pop(context);
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
        ),
      ),
    );
  }
}
