import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studentapp/cart.dart';
import 'package:studentapp/dummydata.dart';
import 'package:studentapp/single_product.dart';
import 'package:studentapp/widgets.dart/my_text_widget.dart';
import 'package:studentapp/widgets.dart/product_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> categories = [
  'All',
  'men\'s clothing',
  'jewelery',
  'electronics',
  'women\'s clothing'
];

late String selectedCategory = categories[0];

List<Map<String, dynamic>> categorisedList = productsList;

// Add to Cart
void addToCart(Map<String, dynamic> product) {
  if (cartList.contains(product)) {
    cartList.remove(product);
  } else {
    cartList.add(product);
  }
}

class _HomePageState extends State<HomePage> {
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
            child: Stack(children: [
              Positioned(
                  left: 10,
                  child: Text(
                    cartList.length.toString(),
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Cart();
                    }));
                  },
                  icon: const Icon(Icons.shopping_cart)),
            ]),
          )
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
            const MyTextField(hintText: 'search furniture',),
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
                              ? productsList
                              : productsList
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
                itemCount: categorisedList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SingleProduct(
                          singleProduct: categorisedList[index],
                        );
                      }));
                    },
                    child: ProductCardWidget(
                      product: categorisedList[index],
                      onPressed: () {
                        setState(() {
                          addToCart(categorisedList[index]);
                        });
                      },
                    ),
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
