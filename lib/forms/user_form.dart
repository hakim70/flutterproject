import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  List<Map<String, String>> users = [];

  void _addUser() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        users.add({
          'username': usernameController.text,
          'email': emailController.text,
          'role': roleController.text,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Utilisateur ajouté avec succès !'),
            backgroundColor: Colors.green,
          ),
        );
        _clearFields();
      });
    }
  }

  void _updateUser(int index) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        users[index] = {
          'username': usernameController.text,
          'email': emailController.text,
          'role': roleController.text,
        };
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Utilisateur modifié avec succès !'),
            backgroundColor: Colors.blue,
          ),
        );
        _clearFields();
      });
    }
  }

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Utilisateur supprimé !'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }

  void _clearFields() {
    usernameController.clear();
    emailController.clear();
    roleController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion des Utilisateurs'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Nom d'utilisateur
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Nom d\'utilisateur',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Le nom d\'utilisateur est obligatoire' : null,
                      ),
                      SizedBox(height: 16),
                      // Email
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'L\'email est obligatoire';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return 'Veuillez entrer un email valide';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      // Rôle
                      TextFormField(
                        controller: roleController,
                        decoration: InputDecoration(
                          labelText: 'Rôle',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.security),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Le rôle est obligatoire' : null,
                      ),
                      SizedBox(height: 20),
                      // Bouton d'enregistrement
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _addUser,
                        child: Text(
                          'Ajouter',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Liste des utilisateurs
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(user['username']!),
                        subtitle: Text('Email: ${user['email']} \nRôle: ${user['role']}'),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                setState(() {
                                  usernameController.text = user['username']!;
                                  emailController.text = user['email']!;
                                  roleController.text = user['role']!;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteUser(index),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
