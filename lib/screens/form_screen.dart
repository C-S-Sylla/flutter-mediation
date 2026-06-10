import 'package:flutter/material.dart';
import '../models/mediation.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _key = GlobalKey<FormState>();
  final _obj = TextEditingController();
  final _part = TextEditingController();
  final _med = TextEditingController();
  bool _res = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nouveau Registre")),
      body: Form(
        key: _key,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(controller: _obj, decoration: const InputDecoration(labelText: "Objet"), validator: (v) => v!.isEmpty ? "Champ requis" : null),
            TextFormField(controller: _part, decoration: const InputDecoration(labelText: "Parties"), validator: (v) => v!.isEmpty ? "Champ requis" : null),
            TextFormField(controller: _med, decoration: const InputDecoration(labelText: "Médiateur"), validator: (v) => v!.isEmpty ? "Champ requis" : null),
            CheckboxListTile(title: const Text("Résolu"), value: _res, onChanged: (v) => setState(() => _res = v!)),
            ElevatedButton(onPressed: () {
              if (_key.currentState!.validate()) {
                Navigator.pop(context, Mediation(id: DateTime.now().toString(), objet: _obj.text, parties: _part.text, mediateur: _med.text, date: DateTime.now(), resolu: _res));
              }
            }, child: const Text("Enregistrer"))
          ],
        ),
      ),
    );
  }
}