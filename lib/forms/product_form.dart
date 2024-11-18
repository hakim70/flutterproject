import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Nom du produit'),
            validator: (value) => value!.isEmpty ? 'Champ obligatoire' : null,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Prix'),
            keyboardType: TextInputType.number,
            validator: (value) => value!.isEmpty ? 'Champ obligatoire' : null,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Quantité en stock'),
            keyboardType: TextInputType.number,
          ),
          DropdownButtonFormField(
            items: ['Catégorie 1', 'Catégorie 2']
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {},
            decoration: InputDecoration(labelText: 'Catégorie'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Traitement du formulaire
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Produit ajouté avec succès')),
                );
              }
            },
            child: Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}
