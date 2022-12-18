import 'package:flutter/material.dart';
import 'package:seller/models/Trending_pro.dart';

class productTil extends StatelessWidget {
  const productTil({Key? key, required this.pro1}) : super(key: key);
  final TrendingPro pro1;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      child: Column(
        children: [
          Image.network(
            "${pro1.image}",
            height: 170,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text("${pro1.title}"),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              const SizedBox(
                height: 10,
              ),
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star, color: Colors.yellow),
              Text("(${pro1.review})"),
            ],
          )
        ],
      ),
    ));
  }
}
