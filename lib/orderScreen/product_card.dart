// import 'package:flutter/material.dart';
// import 'package:seller/models/product_model.dart';

// class ProductCard extends StatelessWidget {
//   ProductCard({Key? key, required this.productmodel}) : super(key: key);
//   ProductModel productmodel;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         child: Column(
//           children: [
//             Image.network(
//               '${productmodel.image}',
//               height: 170,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             Column(
//               // ignore: prefer_const_literals_to_create_immutables
//               children: [
//                 Text("${productmodel.title}"),
//                 Text("${productmodel.price}"),
//                 SizedBox(
//                   height: 15,
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     color: const Color(0xff8D9EFF),
//                     child: Container(
//                         child: productmodel.isOrder == true
//                             ? Text("pending")
//                             : Text("processing")),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
