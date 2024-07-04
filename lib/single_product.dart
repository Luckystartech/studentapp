import 'package:flutter/material.dart';
import 'package:studentapp/cart.dart';
import 'package:studentapp/dummydata.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key, required this.singleProduct});

  final Map<String, dynamic> singleProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.favorite_outline),
          ),
          IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Cart();
                  }));
                },
                icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            Image.network(singleProduct['image']),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                '${singleProduct['title']}',
                style: const TextStyle(fontSize: 24),
              ),
              trailing: Text(
                '\$${singleProduct['price']}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                cartList.add(singleProduct);
              },
              child: const Text('Add to Cart', style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
