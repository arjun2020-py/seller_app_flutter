import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seller/product_screen/view/product_details.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.productData});

  final QueryDocumentSnapshot<Object?> productData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDeatils(product: productData),
        ));
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
                  // 'https://rukminim1.flixcart.com/image/832/832/xif0q/t-shirt/w/t/2/-original-imagg26aa3gz5yym.jpeg?q=70',
                  productData['proImage'].toString(),
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
          subtitle: Column(
            children: [
              Text(productData['proName'].toString()),
              const SizedBox(
                height: 10,
              ),
              Text(productData['proDecrption'].toString()),
              const SizedBox(
                height: 10,
              ),
              Text(productData['proPrice'].toString()),
            ],
          ),
        ),
      ),
    );
  }
}