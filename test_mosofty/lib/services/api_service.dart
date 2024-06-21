import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_mosofty/models/employee.dart';
import 'package:test_mosofty/models/project.dart';

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

  static Future<List<Employee>> getEmployees() async {
    final response = await http.get(Uri.parse('$baseUrl/persons/all'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Employee.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  static Future<Employee> getEmployeeById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/persons/$id'));
    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
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

  static Future<List<Project>> fetchProjets() async {
    final response = await http.get(Uri.parse('$baseUrl/projects/all'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Project.fromJson(json)).toList();
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

  static Future<List<Project>> getProjects({int page = 0, int size = 5}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/projects?page=$page&size=$size'),
    );

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body)['content'] as List;
      return jsonList.map((json) => Project.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }

  static Future<void> AssignedProjectsToEmployee(
      int projectId, List<Map<String, dynamic>> employees) async {
    final response = await http.post(
      Uri.parse('$baseUrl/projectsdone/UsersProject'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'project': {'idpro': projectId},
        'list': employees,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to assign project');
    }
  }
}
