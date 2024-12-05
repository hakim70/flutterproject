import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Produit'),
        backgroundColor: Color(0xFF2196F3), // Bleu vif de la charte
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
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Text(
                    "Informations du Produit",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2B2B2B), // Noir foncé pour le contraste
                    ),
                  ),
                  Divider(color: Color(0xFF2196F3)), // Ligne bleue
                  SizedBox(height: 16),
                  // Nom du produit
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nom du produit',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2196F3)), // Bordure bleue
                      ),
                      prefixIcon: Icon(Icons.label, color: Color(0xFF2196F3)),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Le nom est obligatoire' : null,
                  ),
                  SizedBox(height: 16),
                  // Prix
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Prix',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2196F3)),
                      ),
                      prefixIcon: Icon(Icons.attach_money, color: Color(0xFF2196F3)),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'Le prix est obligatoire' : null,
                  ),
                  SizedBox(height: 16),
                  // Ancien Prix
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ancien Prix',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.money_off, color: Color(0xFF2196F3)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  // Stock
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Stock',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.inventory, color: Color(0xFF2196F3)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  // Image
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'URL de l\'Image',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.image, color: Color(0xFF2196F3)),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Vidéo
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'URL de la Vidéo',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.video_library, color: Color(0xFF2196F3)),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Description
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.description, color: Color(0xFF2196F3)),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 16),
                  // Statut
                  DropdownButtonFormField(
                    items: ['Disponible', 'Indisponible']
                        .map(
                          (status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ),
                        )
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Statut',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.toggle_on, color: Color(0xFF2196F3)),
                    ),
                    onChanged: (value) {},
                    validator: (value) =>
                        value == null ? 'Le statut est obligatoire' : null,
                  ),
                  SizedBox(height: 32),
                  // Bouton d'enregistrement
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2196F3),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Produit ajouté avec succès !',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Enregistrer',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
