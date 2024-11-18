import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/sidebar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      drawer: Sidebar(),
      body: Center(
        child: Text('Bienvenue au Dashboard', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
