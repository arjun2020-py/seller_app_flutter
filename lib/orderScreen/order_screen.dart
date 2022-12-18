import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Center(
            child: Text(
              "Orders",
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: const [
            Icon(
              Icons.notifications_active_outlined,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.edit,
              color: Colors.black,
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              )
            ],
          ),
        ));
  }
}
