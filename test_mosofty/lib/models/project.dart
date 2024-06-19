import 'dart:ffi';

class Project {
  final int id;
  final String nom;
  final String description;
  final Float latitude;
  final Float longitude;

  Project(
      {required this.id,
      required this.nom,
      required this.description,
      required this.latitude,
      required this.longitude});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      nom: json['nom'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
