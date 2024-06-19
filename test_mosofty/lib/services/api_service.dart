import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = 'http://63.250.52.98:9305';

  static Future<void> addEmployee(
      String nom, String prenom, String username, String mail) async {
    final response = await http.post(
      Uri.parse('$baseUrl/persons/new'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nom': nom,
        'prenom': prenom,
        'username': username,
        'mail': mail,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add employee');
    }
  }

  static Future<List<dynamic>> getEmployees() async {
    final response = await http.get(Uri.parse('$baseUrl/persons/all'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load employees');
    }
  }

  static Future<Map<String, dynamic>> getEmployeeById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/persons/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load employee');
    }
  }

  static Future<void> updateEmployee(
      int id, String nom, String prenom, String username, String mail) async {
    final response = await http.put(
      Uri.parse('$baseUrl/persons/upuserr/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nom': nom,
        'prenom': prenom,
        'username': username,
        'mail': mail,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update employee');
    }
  }

  static Future<void> createProject(
      String nom, String description, String latitude, String longitude) async {
    final response = await http.post(
      Uri.parse('$baseUrl/projects/create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nom': nom,
        'description': description,
        'latitude': latitude,
        'longitude': longitude,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create project');
    }
  }

  static Future<List<dynamic>> getProjects() async {
    final response = await http.get(Uri.parse('$baseUrl/projects/all'));
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      return responseBody['projects'] as List<dynamic>;
    } else {
      throw Exception('Failed to load projects');
    }
  }

  static Future<void> assignProject(
      int projectId, List<Map<String, dynamic>> employees) async {
    final url = Uri.parse('$baseUrl/assign/user-projects?page=0&size=5');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'project': {'idpro': projectId.toString()},
        'list': employees
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to assign project');
    }
  }

  static Future<List<dynamic>> getAssignedProjects() async {
    final response = await http.get(Uri.parse('$baseUrl/projectsdone/all'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load assigned projects');
    }
  }
}




/* import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee.dart';
import '../models/project.dart';

class ApiService {
  static const String baseUrl = 'http://63.250.52.98:9305';

  Future<List<Employee>> getEmployees() async {
    final response = await http.get(Uri.parse('$baseUrl/persons'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Employee.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  Future<Employee> getEmployeeById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/persons/$id'));
    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load employee');
    }
  }

  Future<void> addEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse('$baseUrl/persons/new'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(employee.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add employee');
    }
  }

  Future<void> updateEmployee(int id, Employee employee) async {
    final response = await http.put(
      Uri.parse('$baseUrl/persons/upuserr/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(employee.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update employee');
    }
  }

  Future<List<Project>> getProjects() async {
    final response = await http.get(Uri.parse('$baseUrl/projects'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Project.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }

  Future<void> addProject(Project project) async {
    final response = await http.post(
      Uri.parse('$baseUrl/projects/create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(project.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add project');
    }
  }

  Future<void> assignProjectToEmployees(
      int projectId, List<int> employeeIds) async {
    final response = await http.post(
      Uri.parse('$baseUrl/projectsdone/UsersProject'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'project': {'idpro': projectId},
        'list': employeeIds.map((id) => {'id': id, 'itemName': ''}).toList(),
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to assign project');
    }
  }

  Future<List<Project>> getAssignedProjects() async {
    final response = await http.get(Uri.parse('$baseUrl/projectsdone/all'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Project.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load assigned projects');
    }
  }
}
 */