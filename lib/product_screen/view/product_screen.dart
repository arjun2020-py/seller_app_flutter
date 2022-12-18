import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seller/product_screen/view/add_product.dart';
import 'package:seller/product_screen/view/product_card.dart';

import 'product_details.dart';

class TrendingProduct extends StatelessWidget {
  TrendingProduct({
    super.key,
  });
  CollectionReference proRef =
      FirebaseFirestore.instance.collection('Product_collection');

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var ProItems;

  @override
  Widget build(BuildContext context) {
    print(_auth.currentUser!.uid);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('Home');
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
      body: StreamBuilder<QuerySnapshot>(
        stream: proRef
            .where('userid', isEqualTo: _auth.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.docs);
            final proItems = snapshot.data!.docs;
            //  print(proItems[0]['proName']);
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 350,
                  childAspectRatio: 0.75),
              itemCount: proItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(productData: proItems[index]);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddProduct(),
          ));
          // showModalBottomSheet(
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (context) {
          //     return modelTextfield(
          //       buttonType: true,
          //       proname: '',
          //       prodesc: '',
          //       proPrice: '',
          //     );
          //   },
          // );
        },
      ),
    );
  }
}






      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
       // Row(
         
         
         
                          //   mainAxisSize: MainAxisSize.min,
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     Card(
                          //       child: TextButton(onPressed: () {}, child: Text('Update')),
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(10)),
                          //     ),
                          //     Card(
                          //       child: TextButton(onPressed: () {}, child: Text('Delete')),
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(10)),
                          //     )
                          //   ],
                          // ),