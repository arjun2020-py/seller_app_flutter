import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seller/dashboad/view/dashboad.dart';
import 'package:seller/product_screen/view/product_screen.dart';
import 'package:seller/profileScreen/view/profile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  // ignore: non_constant_identifier_names
  final Tabs = [
    DashboadScreen(),
    Center(child: Text("view orders")),
    TrendingProduct(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        selectedFontSize: 10,
        // unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard_outlined),
              label: "Home",
              backgroundColor: Colors.black),
          const BottomNavigationBarItem(
              icon: Icon(Icons.category_sharp),
              label: "View orders",
              backgroundColor: Colors.black),
          const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gift),
              label: "View Product",
              backgroundColor: Colors.black),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.black)
        ],
        onTap: (value) {
          setState(() {
            _currentindex = value;
          });
        },
      ),
    );
  }
}
