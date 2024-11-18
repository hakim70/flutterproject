// main.dart
import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/add_product_screen.dart';

void main() {
  runApp(AdminDashboardApp());
}

class AdminDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardScreen(),
        '/add-product': (context) => AddProductScreen(),
      },
    );
  }
}
