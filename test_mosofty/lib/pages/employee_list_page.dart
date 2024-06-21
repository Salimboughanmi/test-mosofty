/* import 'package:flutter/material.dart';
import 'package:test_mosofty/models/employee.dart';
import 'package:test_mosofty/services/api_service.dart';

class EmployeeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des employés')),
      body: FutureBuilder<List<Employee>>(
        future: ApiService.getEmployees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun employé trouvé'));
          } else {
            final employees = snapshot.data!;
            return ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  title: Text('${employee.nom} ${employee.prenom}'),
                  subtitle: Text(employee.mail),
                );
              },
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

class EmployeeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des employés')),
      body: FutureBuilder<List<Employee>>(
        future: ApiService.getEmployees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun employé trouvé'));
          } else {
            final employees = snapshot.data!;
            return ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  title: Text('${employee.nom} ${employee.prenom}'),
                  subtitle: Text(employee.mail),
                  onTap: () {
                    // Naviguer vers la page de mise à jour avec l'ID de l'employé
                    Navigator.pushNamed(context, '/update_employee',
                        arguments: employee.id);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
