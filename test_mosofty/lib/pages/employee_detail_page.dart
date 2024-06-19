import 'package:flutter/material.dart';
import 'package:test_mosofty/services/api_service.dart';

class EmployeeDetailPage extends StatelessWidget {
  final int id;

  EmployeeDetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails de l\'employé')),
      body: FutureBuilder<Map<String, dynamic>>(
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
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nom: ${employee['nom']}',
                      style: TextStyle(fontSize: 20)),
                  Text('Prénom: ${employee['prenom']}',
                      style: TextStyle(fontSize: 20)),
                  Text('Username: ${employee['username']}',
                      style: TextStyle(fontSize: 20)),
                  Text('Mail: ${employee['mail']}',
                      style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
