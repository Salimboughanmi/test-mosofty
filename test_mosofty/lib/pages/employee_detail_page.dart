/* import 'package:flutter/material.dart';
import 'package:test_mosofty/models/employee.dart';
import 'package:test_mosofty/services/api_service.dart';

class EmployeeDetailPage extends StatelessWidget {
  final int id;

  EmployeeDetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails de l\'employé')),
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
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nom: ${employee.nom}', style: TextStyle(fontSize: 20)),
                  Text('Prénom: ${employee.prenom}',
                      style: TextStyle(fontSize: 20)),
                  Text('Username: ${employee.username}',
                      style: TextStyle(fontSize: 20)),
                  Text('Mail: ${employee.mail}',
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
 */
import 'package:flutter/material.dart';
import 'package:test_mosofty/models/employee.dart';
import 'package:test_mosofty/services/api_service.dart';

class EmployeeDetailPage extends StatefulWidget {
  @override
  _EmployeeDetailPageState createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  TextEditingController idController = TextEditingController();
  Employee? employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails de l\'employé')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Entrez l\'ID de l\'employé',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int id = int.tryParse(idController.text) ?? 0;
                if (id != 0) {
                  _fetchEmployeeDetails(id);
                }
              },
              child: Text('Charger les détails'),
            ),
            SizedBox(height: 20),
            if (employee != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nom: ${employee!.nom}', style: TextStyle(fontSize: 20)),
                  Text('Prénom: ${employee!.prenom}',
                      style: TextStyle(fontSize: 20)),
                  Text('Username: ${employee!.username}',
                      style: TextStyle(fontSize: 20)),
                  Text('Mail: ${employee!.mail}',
                      style: TextStyle(fontSize: 20)),
                ],
              ),
            if (employee == null) Center(child: Text('Aucun employé chargé')),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchEmployeeDetails(int id) async {
    try {
      Employee emp = await ApiService.getEmployeeById(id);
      setState(() {
        employee = emp;
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Impossible de charger les détails de l\'employé.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
