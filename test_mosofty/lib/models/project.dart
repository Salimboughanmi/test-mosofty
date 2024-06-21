class Project {
  final int id;
  final String nom;
  final String description;
  final String date;
  final double latitude;
  final double longitude;

  Project({
    required this.id,
    required this.nom,
    required this.description,
    required this.date,
    required this.latitude,
    required this.longitude,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['idpro'] as int,
      nom: json['nom'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      latitude: double.tryParse(json['latitude'].toString()) ?? 0.0,
      longitude: double.tryParse(json['longitude'].toString()) ?? 0.0,
    );
  }
}
