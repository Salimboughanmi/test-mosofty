// project_list_page.dart

import 'package:flutter/material.dart';
import 'package:test_mosofty/models/project.dart';
import 'package:test_mosofty/services/api_service.dart';

class ProjectListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des projets affectés aux employés')),
      body: FutureBuilder<List<Project>>(
        future: ApiService.getProjects(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun projet trouvé'));
          } else {
            final projects = snapshot.data!;
            return ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return ListTile(
                  title: Text(project.nom),
                  subtitle: Text(project.description),
                  onTap: () {
                    // Ajoutez ici le code pour gérer le clic sur un projet si nécessaire
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
