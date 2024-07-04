import 'package:flutter/material.dart';
import 'package:studentapp/widgets.dart/my_text_widget.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new product'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            MyTextField(hintText: 'title'),
            SizedBox(height: 40),
            MyTextField(hintText: 'price'),
            SizedBox(height: 40),
            MyTextField(hintText: 'Description'),
            SizedBox(height: 40),
            
          ],
        ),
      ),
    );
  }
}