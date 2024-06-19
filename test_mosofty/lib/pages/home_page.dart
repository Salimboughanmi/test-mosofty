/* import 'package:flutter/material.dart';
import 'package:test_mosofty/services/api_service.dart';
import '../models/employee.dart';
import 'add_employee_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  List<Employee> employees = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEmployees();
  }

  Future<void> fetchEmployees() async {
    try {
      List<Employee> fetchedEmployees = await apiService.getEmployees();
      setState(() {
        employees = fetchedEmployees;
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion des Employés'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  title: Text('${employee.nom} ${employee.prenom}'),
                  subtitle: Text(employee.mail),
                  onTap: () {
                    // Navigate to edit screen
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEmployeeScreen()),
          ).then((_) => fetchEmployees()); // Refresh list after adding
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
 */