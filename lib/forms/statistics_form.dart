import 'package:flutter/material.dart';

class StatisticsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Statistiques générales', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Text('Nombre total de commandes: 120'),
          Text('Total des ventes: \$2500'),
          Text('Nombre d\'utilisateurs: 350'),
        ],
      ),
    );
  }
}
