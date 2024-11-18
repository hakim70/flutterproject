import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/products_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/users_screen.dart';
import 'screens/statistics_screen.dart';
import 'screens/recommendations_screen.dart';

void main() {
  runApp(AdminDashboardApp());
}

class AdminDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/products': (context) => ProductsScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/orders': (context) => OrdersScreen(),
        '/users': (context) => UsersScreen(),
        '/statistics': (context) => StatisticsScreen(),
        '/recommendations': (context) => RecommendationsScreen(),
      },
    );
  }
}
