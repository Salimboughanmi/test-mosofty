import 'package:flutter/material.dart';
import 'package:test_mosofty/pages/add_employee_page.dart';
import 'package:test_mosofty/pages/assigned_projects_page.dart';
import 'package:test_mosofty/pages/create_project_page.dart';
import 'package:test_mosofty/pages/employee_detail_page.dart';
import 'package:test_mosofty/pages/employee_list_page.dart';
import 'package:test_mosofty/pages/project_list_page.dart';
import 'package:test_mosofty/pages/update_employee_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Technique',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/add_employee': (context) => AddEmployeePage(),
        '/employee_list': (context) => EmployeeListPage(),
        '/project_list': (context) => ProjectListPage(),
        '/employee_detail': (context) => EmployeeDetailPage(),
        '/create_project': (context) => CreateProjectPage(),
        '/ProjectListPage': (context) => ProjectListPage(),
        '/assigned_projects': (context) => AssignProjectPage(),
        '/update_employee': (context) => UpdateEmployeePage(
              id: ModalRoute.of(context)!.settings.arguments as int,
            )
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_employee');
              },
              child: Text('Ajouter un employé'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/employee_list');
              },
              child: Text('Liste des employés'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create_project');
              },
              child: Text('Créer un projet'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/project_list');
              },
              child: Text('Liste des projets'),
            ),
            ElevatedButton(
              onPressed: () {
                int id = 1;
                Navigator.pushNamed(context, '/employee_detail', arguments: id);
              },
              child: Text('Détails de l\'employé'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/assigned_projects');
              },
              child: Text('Affecter un projet'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ProjectListPage');
              },
              child: Text('liste de projet affecter au employés'),
            ),
          ],
        ),
      ),
    );
  }
}
