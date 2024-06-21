import 'package:flutter/material.dart';
import 'package:test_mosofty/models/employee.dart';
import 'package:test_mosofty/services/api_service.dart';

class UpdateEmployeePage extends StatelessWidget {
  final int id;
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  UpdateEmployeePage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modifier un employé')),
      body: FutureBuilder<Employee>(
        future: ApiService.getEmployeeById(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Employé non trouvé'));
          } else {
            final employee = snapshot.data!;
            nomController.text = employee.nom;
            prenomController.text = employee.prenom;
            usernameController.text = employee.username;
            mailController.text = employee.mail;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
                      try {
                        await ApiService.updateEmployee(
                          id,
                          nomController.text,
                          prenomController.text,
                          usernameController.text,
                          mailController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Employé mis à jour avec succès')),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Erreur lors de la mise à jour de l\'employé')),
                        );
                      }
                    },
                    child: Text('Mettre à jour'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
