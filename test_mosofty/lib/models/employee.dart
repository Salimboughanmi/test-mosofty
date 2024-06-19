class Employee {
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
