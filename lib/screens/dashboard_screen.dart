import 'package:flutter/material.dart';

import '../widgets/navbar.dart';
import '../widgets/sidebar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('Revenue', '\DT40,000', Colors.green),
                  _buildStatCard('Expenses', '\DT25,000', Colors.red),
                  _buildStatCard('Profit', '\DT15,000', Colors.blue),
                ],
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Graphique des données',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Projets',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildProjectList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectList() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text('Server Migration'),
          subtitle: Text('50% Complete'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.check_circle, color: Colors.orange),
          title: Text('Sales Tracking'),
          subtitle: Text('30% Complete'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.check_circle, color: Colors.blue),
          title: Text('Customer Database'),
          subtitle: Text('70% Complete'),
        ),
      ],
    );
  }
}
