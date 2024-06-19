import 'package:flutter/material.dart';
import 'package:test_mosofty/services/api_service.dart';

class AddEmployeePage extends StatelessWidget {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter un employé')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: prenomController,
              decoration: InputDecoration(labelText: 'Prénom'),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: mailController,
              decoration: InputDecoration(labelText: 'Mail'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await ApiService.addEmployee(
                  nomController.text,
                  prenomController.text,
                  usernameController.text,
                  mailController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('EMPLOYEE créé avec succès')),
                );
                Navigator.pop(context);
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
