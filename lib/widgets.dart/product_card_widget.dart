import 'package:flutter/material.dart';
import 'package:studentapp/dummydata.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
    required this.onPressed,
  });

  final Map<String, dynamic> product;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
  bool isClicked = false;
    return Card(
      child: Column(
        children: [
          Image.network('${product['image']}',
              width: 150, height: 150),
          ListTile(
            title: Text('${product['title']}'
                .substring(0, 10)),
            subtitle:
                Text('\$${product['price']}'),
            trailing: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                    isSelected: cartList.contains(product) ? !isClicked : isClicked,
                    selectedIcon: const Icon(Icons.check_circle, color: Colors.white,),
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ))),
          )
        ],
      ),
    );
  }
}
