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
  final screens = const [HomePage(), CreateProduct(), Cart()];

  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit), label: 'Create Product'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cart')
        ],
      ),
    );
  }
}
