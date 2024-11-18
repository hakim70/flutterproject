import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
            validator: (value) => value!.isEmpty ? 'Champ obligatoire' : null,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Rôle'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Utilisateur ajouté')),
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
