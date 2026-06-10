import 'package:flutter/material.dart';
import '../models/mediation.dart';

class MediationCard extends StatelessWidget {
  final Mediation mediation;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const MediationCard({super.key, required this.mediation, required this.onTap, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 5))        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        onTap: onTap,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: mediation.resolu ? Colors.green[50] : Colors.orange[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            mediation.resolu ? Icons.verified : Icons.access_time_filled,
            color: mediation.resolu ? Colors.green : Colors.orange,
          ),
        ),
        title: Text(mediation.objet, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(mediation.parties),
            const SizedBox(height: 5),
            Text(
              "${mediation.date.day}/${mediation.date.month}/${mediation.date.year}",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_sweep, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}