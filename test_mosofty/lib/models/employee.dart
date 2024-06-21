/* class Employee {
  final int id;
  final String nom;
  final String prenom;
  final String username;
  final String mail;

  Employee(
      {required this.id,
      required this.nom,
      required this.prenom,
      required this.username,
      required this.mail});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      username: json['username'],
      mail: json['mail'],
    );
  }
}
 */
/* class Employee {
  final int id;
  final String nom;
  final String prenom;
  final String username;
  final String mail;

  Employee({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.username,
    required this.mail,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as int,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      username: json['username'] as String,
      mail: json['mail'] as String,
    );
  }
}
 */
class Employee {
  final int id;
  final String nom;
  final String prenom;
  final String username;
  final String mail;

  Employee({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.username,
    required this.mail,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    print("JSON from server: $json"); // Add this line for debugging
    return Employee(
      id: json['idperson'] as int? ?? 0,
      nom: json['nom'] ?? '',
      prenom: json['prenom'] ?? '',
      username: json['username'] ?? '',
      mail: json['mail'] ?? '',
    );
  }
}
