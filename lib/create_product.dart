import 'package:flutter/material.dart';
import 'package:studentapp/cache.dart';
import 'package:studentapp/dummydata.dart';
import 'package:studentapp/homepage.dart';
import 'package:studentapp/widgets.dart/text_field_widget.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  String dropDownValue = categories[1];

  final titleTextController = TextEditingController();
  final priceTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  @override
  void dispose() {
    titleTextController.dispose();
    priceTextController.dispose();
    descriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            TextFieldWidget(
              textEditingController: titleTextController,
              hintText: 'title',
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              textEditingController: priceTextController,
              keyboardType: TextInputType.number,
              hintText: 'price',
            ),
            DropdownButton(
                value: dropDownValue,
                items: categories.map((category) {
                  return DropdownMenuItem(
                      value: category, child: Text(category));
                }).toList(),
                onChanged: (newCategory) {
                  setState(() {
                    dropDownValue = newCategory!;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              textEditingController: descriptionTextController,
              hintText: 'description',
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Map<String, dynamic> newProduct = {
                  "id": 24,
                  "title": titleTextController.text,
                  "price": double.parse(priceTextController.text),
                  "description": descriptionTextController.text,
                  "category": dropDownValue,
                  "image":
                      "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
                  "rating": {"rate": 3.6, "count": 145}
                };

                allProducts.add(newProduct);
                saveData(allProducts);

                titleTextController.clear();
                priceTextController.clear();
                descriptionTextController.clear();

                // print(newProduct);
              },
              color: Colors.blue,
              minWidth: MediaQuery.of(context).size.width,
              height: 50,
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
