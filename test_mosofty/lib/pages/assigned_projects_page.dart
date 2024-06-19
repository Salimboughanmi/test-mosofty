import 'package:flutter/material.dart';
import 'package:test_mosofty/models/employee.dart';
import 'package:test_mosofty/models/project.dart';
import 'package:test_mosofty/services/api_service.dart';

class AssignProjectPage extends StatefulWidget {
  @override
  _AssignProjectPageState createState() => _AssignProjectPageState();
}

class _AssignProjectPageState extends State<AssignProjectPage> {
  List<Employee> employees = [];
  List<Project> projects = [];
  Employee? selectedEmployee;
  Project? selectedProject;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final employeeList = await ApiService.getEmployees();
      final projectList = await ApiService.getProjects();
      setState(() {
        employees = employeeList.map((e) => Employee.fromJson(e)).toList();
        projects = projectList.map((p) => Project.fromJson(p)).toList();
      });
    } catch (error) {
      // Handle errors as necessary
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Affecter un projet aux employés')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<Employee>(
              hint: Text('Sélectionner un employé'),
              value: selectedEmployee,
              onChanged: (Employee? newValue) {
                setState(() {
                  selectedEmployee = newValue;
                });
              },
              items: employees
                  .map<DropdownMenuItem<Employee>>((Employee employee) {
                return DropdownMenuItem<Employee>(
                  value: employee,
                  child: Text('${employee.nom} ${employee.prenom}'),
                );
              }).toList(),
            ),
            DropdownButton<Project>(
              hint: Text('Sélectionner un projet'),
              value: selectedProject,
              onChanged: (Project? newValue) {
                setState(() {
                  selectedProject = newValue;
                });
              },
              items: projects.map<DropdownMenuItem<Project>>((Project project) {
                return DropdownMenuItem<Project>(
                  value: project,
                  child: Text(project.nom),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (selectedEmployee != null && selectedProject != null) {
                  await ApiService.assignProject(
                    selectedProject!.id,
                    [
                      {
                        'id': selectedEmployee!.id,
                        'itemName':
                            '${selectedEmployee!.nom} ${selectedEmployee!.prenom}'
                      }
                    ],
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Projet affecté avec succès')),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Veuillez sélectionner un employé et un projet')),
                  );
                }
              },
              child: Text('Affecter le projet'),
            ),
          ],
        ),
      ),
    );
  }
}
