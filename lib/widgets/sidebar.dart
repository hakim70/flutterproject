import 'package:flutter/material.dart';
import 'package:admin_dashboard/screens/products_screen.dart';
import 'package:admin_dashboard/screens/categories_screen.dart';
import 'package:admin_dashboard/screens/orders_screen.dart';
import 'package:admin_dashboard/screens/users_screen.dart';
import 'package:admin_dashboard/screens/statistics_screen.dart';
import 'package:admin_dashboard/screens/recommendations_screen.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Text('Menu', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Text('Produits'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen()));
            },
          ),
          ListTile(
            title: Text('Catégories'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
            },
          ),
          ListTile(
            title: Text('Commandes'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersScreen()));
            },
          ),
          ListTile(
            title: Text('Utilisateurs'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UsersScreen()));
            },
          ),
          ListTile(
            title: Text('Statistiques'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StatisticsScreen()));
            },
          ),
          ListTile(
            title: Text('Recommandations'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RecommendationsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
