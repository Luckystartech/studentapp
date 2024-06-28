import 'package:flutter/material.dart';
import 'package:studentapp/dummydata.dart';
import 'package:studentapp/single_product.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({super.key, required this.products});

  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        mainAxisExtent: 250,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SingleProduct(singleProduct: products[index],);
        }));
      },
          child: Card(
            child: Column(
              children: [
                Image.network('${products[index]['image']}',
                    width: 150, height: 150),
                ListTile(
                  title: Text('${products[index]['title']}'.substring(0, 10)),
                  subtitle: Text('\$${products[index]['price']}'),
                  trailing: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
