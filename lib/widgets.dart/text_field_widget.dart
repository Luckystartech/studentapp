import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key, required this.hintText, this.textEditingController, this.keyboardType});
  final String hintText;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(style: BorderStyle.solid),
      ),
      child: TextField(
        controller: textEditingController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
      ),
    );
  }
}
