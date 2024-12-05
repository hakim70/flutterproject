import 'package:flutter/material.dart';

class CategoryForm extends StatefulWidget {
  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _categories = []; // Liste locale des catégories
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _addCategory() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _categories.add({
          'name': _nameController.text,
          'description': _descriptionController.text,
        });
        _nameController.clear();
        _descriptionController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Catégorie ajoutée avec succès !'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _deleteCategory(int index) {
    setState(() {
      _categories.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Catégorie supprimée !'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gérer les Catégories'),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Formulaire d'ajout de catégorie
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ajouter une Catégorie",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2B2B2B),
                        ),
                      ),
                      Divider(color: Color(0xFF2196F3)),
                      SizedBox(height: 16),
                      // Nom de la catégorie
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Nom de la catégorie',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.category, color: Color(0xFF2196F3)),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Le nom est obligatoire' : null,
                      ),
                      SizedBox(height: 16),
                      // Description de la catégorie
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description de la catégorie',
                          border: OutlineInputBorder(),
                          prefixIcon:
                              Icon(Icons.description, color: Color(0xFF2196F3)),
                        ),
                        maxLines: 3,
                        validator: (value) =>
                            value!.isEmpty ? 'La description est obligatoire' : null,
                      ),
                      SizedBox(height: 16),
                      // Bouton Ajouter
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2196F3),
                            padding:
                                EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: _addCategory,
                          child: Text(
                            'Ajouter',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Liste des catégories
            Expanded(
              child: ListView.builder(
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4.0,
                    child: ListTile(
                      leading: Icon(Icons.category, color: Color(0xFF2196F3)),
                      title: Text(_categories[index]['name']!),
                      subtitle: Text(_categories[index]['description']!),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteCategory(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
