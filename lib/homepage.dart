import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentapp/cart.dart';
import 'package:studentapp/dummydata.dart';
import 'package:studentapp/single_product.dart';
import 'package:studentapp/widgets.dart/product_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Map<String, dynamic>> allProducts = [];

class _HomePageState extends State<HomePage> {
  String selectedCategory = categories[0];

  @override
  void initState() {
    loadData();
    if (allProducts.isEmpty) {
      allProducts = productsList;
    } else {
      loadData();
    }

    super.initState();
  }

  // load Data from cache
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? productString = prefs.getStringList('myProducts');
    if (productString != null) {
      setState(() {
        allProducts = productString
            .map((eachProductString) => jsonDecode(eachProductString))
            .toList()
            .cast<Map<String, dynamic>>();
      });
    }
  }

  List<Map<String, dynamic>> categorisedList = allProducts;

  // Add to Cart or remove from cart
  void addToCart(Map<String, dynamic> product) {
    if (cartList.contains(product)) {
      cartList.remove(product);
    } else {
      cartList.add(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: CircleAvatar(
            radius: 20.0,
            child: Text('L'),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Stack(
                children: [
                  Positioned(
                    left: 6,
                    child: Text(
                      cartList.length.toString(),
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const Cart();
                        }));
                      },
                      icon: const Icon(Icons.shopping_cart)),
                ],
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Text(
              'Your Dream Decoration',
              style: TextStyle(fontSize: 48),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search furniture',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                          categorisedList = selectedCategory == categories[0]
                              ? allProducts
                              : allProducts
                                  .where((product) =>
                                      product['category'] == categories[index])
                                  .toList();
                          print(selectedCategory);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green),
                          color: categories[index] == selectedCategory
                              ? Colors.green
                              : Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          categories[index],
                          style: TextStyle(
                            color: categories[index] == selectedCategory
                                ? Colors.white
                                : Colors.black,
                            fontSize: 20,
                          ),
                        )),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 20),
            // Product Section
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  mainAxisExtent: 250,
                ),
                itemCount: selectedCategory == categories[0]
                    ? allProducts.length
                    : categorisedList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SingleProduct(
                          singleProduct: selectedCategory == categories[0]
                              ? allProducts[index]
                              : categorisedList[index],
                        );
                      }));
                    },
                    child: ProductCardWidget(
                        product: selectedCategory == categories[0]
                            ? allProducts[index]
                            : categorisedList[index],
                        onPressed: () {
                          setState(() {
                            addToCart(selectedCategory == categories[0]
                                ? allProducts[index]
                                : categorisedList[index]);
                          });
                        }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
