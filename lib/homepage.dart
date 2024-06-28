import 'package:flutter/material.dart';
import 'package:studentapp/dummydata.dart';
import 'package:studentapp/single_product.dart';
import 'package:studentapp/widgets.dart/product_grid_widget.dart';

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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.shopping_cart),
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
                              ? productsList
                              : productsList
                                  .where((product) =>
                                      product['category'] ==
                                      categories[index])
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
                child: ProductGridWidget(
              products: categorisedList,
            ))
          ],
        ),
      ),
    );
  }
}
