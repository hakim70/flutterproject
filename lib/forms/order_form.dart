import 'package:flutter/material.dart';

class OrderForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'ID de la commande'),
            validator: (value) => value!.isEmpty ? 'Champ obligatoire' : null,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Client'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Montant total'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Commande enregistrée')),
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
