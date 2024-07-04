import 'package:flutter/material.dart';
import 'package:studentapp/cart.dart';
import 'package:studentapp/create_product.dart';
import 'package:studentapp/homepage.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  List screens = const [HomePage(), CreateProduct(), Cart()];

  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedScreen = value;
          });
        },
        currentIndex: selectedScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit), label: 'Create Product'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: 'Cart'),
        ],
      ),
    );
  }
}
