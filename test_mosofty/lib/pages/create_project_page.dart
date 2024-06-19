import 'package:flutter/material.dart';
import 'package:test_mosofty/services/api_service.dart';

class CreateProjectPage extends StatelessWidget {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Créer un projet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: latitudeController,
              decoration: InputDecoration(labelText: 'Latitude'),
            ),
            TextField(
              controller: longitudeController,
              decoration: InputDecoration(labelText: 'Longitude'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await ApiService.createProject(
                  nomController.text,
                  descriptionController.text,
                  latitudeController.text,
                  longitudeController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Projet créé avec succès')),
                );
                Navigator.pop(context);
              },
              child: Text('Créer'),
            ),
          ],
        ),
      ),
    );
  }
}
