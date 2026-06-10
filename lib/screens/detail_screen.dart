import 'package:flutter/material.dart';
import '../models/mediation.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Mediation m;
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    if (!isInitialized) {
      m = ModalRoute.of(context)!.settings.arguments as Mediation;
      isInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fiche de Médiation"),
        // On renvoie l'objet m à la fermeture pour mettre à jour la liste
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, m),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- EN-TÊTE VISUEL ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    m.resolu ? Icons.check_circle : Icons.pending_actions,
                    size: 80,
                    color: m.resolu ? Colors.green : Colors.orange,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    m.resolu ? "LITIGE RÉSOLU" : "MÉDIATION EN COURS",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: m.resolu ? Colors.green[800] : Colors.orange[800],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("Informations Générales"),
                  _buildInfoTile(Icons.gavel, "Objet", m.objet),
                  _buildInfoTile(Icons.people, "Parties impliquées", m.parties),
                  _buildInfoTile(Icons.person_pin, "Médiateur responsable", m.mediateur),
                  _buildInfoTile(Icons.calendar_today, "Date d'ouverture", 
                    "${m.date.day}/${m.date.month}/${m.date.year}"),
                  
                  const SizedBox(height: 30),
                  
                  // --- BOUTON DE MODIFICATION DE STATUT ---
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          m.resolu = !m.resolu; // Bascule le statut
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(m.resolu ? "Marqué comme résolu" : "Remis en cours"))
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: m.resolu ? Colors.orange : Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      icon: Icon(m.resolu ? Icons.undo : Icons.done_all),
                      label: Text(
                        m.resolu ? "REMETTRE EN COURS" : "MARQUER COMME RÉSOLU",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00695C)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}