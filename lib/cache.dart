import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData(List<Map<String, dynamic>> listofProducts) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> productListString =
      listofProducts.map((eachProduct) => jsonEncode(eachProduct)).toList();
  await prefs.setStringList('myProducts', productListString);
}

// Future<void> clearData() async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.remove('myProducts');
// }