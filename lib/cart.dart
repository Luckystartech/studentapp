import 'package:flutter/material.dart';
import 'package:studentapp/dummydata.dart';
import 'package:studentapp/navigation.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const MyNavigationBar();
              }));
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Center(child: Text('Cart')),
      ),
      body: ListView.builder(
          itemCount: cartList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cartList[index]['title']),
              subtitle: Text(cartList[index]['price'].toString()),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      cartList.remove(cartList[index]);
                    });
                  },
                  icon: const Icon(Icons.delete)),
            );
          }),
    );
  }
}
