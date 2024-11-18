// lib/widgets/product_form.dart
import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  double price = 0.0;
  String category = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Nom du produit'),
            onChanged: (value) => setState(() => name = value),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Prix'),
            keyboardType: TextInputType.number,
            onChanged: (value) => setState(() => price = double.parse(value)),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Catégorie'),
            onChanged: (value) => setState(() => category = value),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Enregistrer le produit
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Produit ajouté avec succès')),
                );
              }
            },
            child: Text('Ajouter le produit'),
          ),
        ],
      ),
    );
  }
}
