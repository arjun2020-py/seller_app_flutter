import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seller/models/Trending_pro.dart';

import 'Trending_til.dart';

class DashboadScreen extends StatelessWidget {
  DashboadScreen({
    super.key,
  });

  List<TrendingPro> product = [
    TrendingPro(
        image:
            "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/48b829ed-bee6-492e-b9bc-1824d5c63bd4_1aa0a835-9bbd-432c-ad92-76d0c2b7a36d_600x.png?v=1646390147",
        title: "Trebel Rockerz 550",
        review: 20),
    TrendingPro(
      image:
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT7sNWyusrXZmPsFvYTc780gy7RFKPLjXUydMVcmPzcCOKE51UFi9yMeuQmLjlfFvQNrQTaftNDzw&usqp=CAc",
      title: "FASTFIT WATCH WITH LIGHT GREY DIAL",
      review: 16,
    ),
    TrendingPro(
        image:
            "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRDyhkqeRcFUANTjcu7dtSraXHRAp-y6PwT5oMaFXsu4urMLiAnfyCDosVMK6egT3_xFiV0Kmdb&usqp=CAc",
        title: "MALAYALI TSHIRT",
        review: 18),
    TrendingPro(
        image:
            "https://rukminim1.flixcart.com/image/540/648/xif0q/shirt/j/j/j/xxl-um005-tigersnake-original-imaghgy5kgt3d6mh.jpeg?q=50",
        title: "Black Solid Running Shoes For Men",
        review: 24),
    TrendingPro(
        image:
            "https://rukminim1.flixcart.com/image/540/648/l16rde80/kurta/r/8/h/xxs-growwish-only-kurta-magic-growwish-original-imagct5mgan5xman.jpeg?q=50",
        title: "Men Solid Cotton Blend Straight Kurta  ",
        review: 28),
    TrendingPro(
        image:
            "https://rukminim1.flixcart.com/image/540/648/xif0q/t-shirt/c/p/k/l-wt27-blwh-eyebogler-original-imaggb2nt2gspwds.jpeg?q=50",
        title: "Color Block Women Round Neck Black T-Shirt",
        review: 30),
    TrendingPro(
      image:
          "https://rukminim1.flixcart.com/image/540/648/l4fxh8w0/dress/g/o/x/s-sgn-blck-ethniclook-original-imagfcc2n8d5yrnd.jpeg?q=50",
      title: "Women Fit and Flare Black Dress",
      review: 35,
    ),
    TrendingPro(
        image:
            "https://rukminim1.flixcart.com/image/540/648/xif0q/kids-t-shirt/e/i/9/10-11-years-kt18-bllafb-eyebogler-original-imaggwysvygnnhfe.jpeg?q=50",
        title: "Boys & Girls Geometric Print Cotton Blend T Shirt",
        review: 38),
    TrendingPro(
        image:
            "https://rukminim1.flixcart.com/image/540/648/xif0q/kids-sandal/s/t/p/5-wc4358-walkaroo-original-imaghfawxmqs34jw.jpeg?q=50",
        title: "Velcro Sports Sandals For Boys",
        review: 32),
    TrendingPro(
        image:
            "https://rukminim1.flixcart.com/image/540/648/xif0q/sandal/c/h/x/3-side1-5647-black-original-imagjrgevbagphnm.jpeg?q=50",
        title: "Women Black Wedges Sandal",
        review: 19),
  ];
  CollectionReference proRef =
      FirebaseFirestore.instance.collection('collectionPath');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        title: const Center(
          child: Text(
            'Dashboad',
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ),
        leading: Text('data'),
        // leading: s
        // ignore: prefer_const_constructors
        // title: Center(
        //   child: const Text(
        //     "John",
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: Colors.black45,
              child: Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
              ),
            ),
            color: Colors.black45,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: const Color(0xffFD841F),
              child: const ListTile(
                leading: Icon(Icons.shopping_cart_checkout_outlined),
                title: Text(
                  "Ordres",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: Text("20"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: const Color(0xff8D9EFF),
              child: const ListTile(
                leading: Icon(Icons.pending_actions_rounded),
                title: Text(
                  "Pending",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: Text("20"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: const Color(0xffFF8FB1),
              child: const ListTile(
                leading: Icon(Icons.developer_mode),
                title: Text(
                  "Processing",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: Text("20"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: const Color(0xffabbfb6),
              child: const ListTile(
                leading: Icon(Icons.cancel_presentation_rounded),
                title: Text(
                  "Canceling",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: Text("20"),
              ),
            ),
          ),
          const Divider(
            thickness: 3,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 180, top: 10),
            child: Text(
              "Top 10 Trending Product",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 250,
                  childAspectRatio: 0.05),
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return productTil(
                  pro1: product[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
