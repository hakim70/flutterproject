// lib/screens/add_product_screen.dart
import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/sidebar.dart';
import '../widgets/product_form.dart';

class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductForm(),
      ),
    );
  }
}