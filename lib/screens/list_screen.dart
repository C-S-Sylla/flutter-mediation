import 'package:flutter/material.dart';
import '../models/mediation.dart';
import '../widgets/mediation_card.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<Mediation> _data = [];
  String _searchQuery = ""; // Pour la recherche
  bool _filter = false;

  void _supprimer(String id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Confirmer la suppression"),
        content: const Text("Cette action est irréversible."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("ANNULER")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() => _data.removeWhere((m) => m.id == id));
              Navigator.pop(ctx);
            }, 
            child: const Text("SUPPRIMER", style: TextStyle(color: Colors.white))
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
final String userName = (ModalRoute.of(context)?.settings.arguments as String?) ?? "Utilisateur";

    // LOGIQUE DE FILTRAGE + RECHERCHE
    final List<Mediation> filtered = _data.where((m) {
      final matchesSearch = m.objet.toLowerCase().contains(_searchQuery.toLowerCase()) || 
                           m.parties.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesFilter = _filter ? !m.resolu : true;
      return matchesSearch && matchesFilter;
    }).toList();

    final double taux = Mediation.calculerTaux(_data);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(" Registre"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/about', arguments: userName),
            icon: const Icon(Icons.account_circle, size: 30),
          )
        ],
      ),
      body: Column(
        children: [
          // DASHBOARD VISUEL
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF00695C),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _statCard("Total", _data.length.toString(), Colors.white),
                    _statCard("Résolus", _data.where((m)=>m.resolu).length.toString(), Colors.greenAccent),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("Progression ", style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: taux / 100,
                  backgroundColor: Colors.white24,
                  color: Colors.greenAccent,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 5),
                Text("${taux.toStringAsFixed(1)}% de réussite", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // BARRE DE RECHERCHE
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: "Rechercher un litige...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
          ),

          // FILTRE RAPIDE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                FilterChip(
                  label: const Text("En attente uniquement"),
                  selected: _filter,
                  onSelected: (val) => setState(() => _filter = val),
                ),
              ],
            ),
          ),

          // LISTE OU MESSAGE VIDE
          Expanded(
            child: filtered.isEmpty 
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 10, bottom: 80),
                  itemCount: filtered.length,
                  itemBuilder: (ctx, i) => MediationCard(
                    mediation: filtered[i],
                    onTap: () async {
                      await Navigator.pushNamed(context, '/detail', arguments: filtered[i]);
                      setState(() {});
                    },
                    onDelete: () => _supprimer(filtered[i].id),
                  ),
                ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF00695C),
        onPressed: () async {
          final res = await Navigator.pushNamed(context, '/form');
          if (res != null) setState(() => _data.add(res as Mediation));
        },
        label: const Text("NOUVELLE MÉDIATION", style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _statCard(String label, String val, Color color) {
    return Column(
      children: [
        Text(val, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 10),
          Text("Aucune médiation trouvée", style: TextStyle(color: Colors.grey[600], fontSize: 18)),
        ],
      ),
    );
  }
}