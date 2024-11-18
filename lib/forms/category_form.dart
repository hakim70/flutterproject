import 'package:flutter/material.dart';

class CategoryForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Nom de la catégorie'),
            validator: (value) => value!.isEmpty ? 'Champ obligatoire' : null,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Catégorie ajoutée avec succès')),
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
