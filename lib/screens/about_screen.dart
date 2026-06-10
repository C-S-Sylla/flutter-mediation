import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Récupérer le nom de l'utilisateur connecté
final String userName = (ModalRoute.of(context)?.settings.arguments as String?) ?? "Anonyme";

    return Scaffold(
      appBar: AppBar(title: const Text("Profil & À propos")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF00695C),
              child: Icon(Icons.verified_user, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 15),
            
            // 2. Affichage de l'utilisateur dynamique
            Text(
              "Session active : $userName",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            
            const Divider(height: 40),

            // Tes infos d'étudiant (statiques)
            _buildInfoCard("Développeur", "Cheikh Sadibou Sylla", Icons.badge),
            _buildInfoCard("Source", "Quartier Fass-Delorme", Icons.source),

            const SizedBox(height: 50),

            // 3. BOUTON DE DÉCONNEXION
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Nettoie tout et retourne au Login
                  Navigator.pushNamedAndRemoveUntil(
                    context, 
                    '/login', 
                    (route) => false // Supprime toutes les pages précédentes
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                icon: const Icon(Icons.logout),
                label: const Text("SE DÉCONNECTER"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title),
        subtitle: Text(content),
      ),
    );
  }
}