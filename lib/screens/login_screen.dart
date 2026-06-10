import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // On utilise les controllers comme appris dans l'exercice précédent
  final TextEditingController _userCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

void _connexion() {
  if (_userCtrl.text.isNotEmpty && _passCtrl.text.isNotEmpty) {
    // On passe le nom de l'utilisateur en argument
    Navigator.pushReplacementNamed(
      context, 
      '/', 
      arguments: _userCtrl.text
    ); 
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Fond sombre de l'image
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bienvenue",
              style: TextStyle(
                color: Color(0xFFD4AF37), // Jaune/Doré de l'image
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            
            // Champ Nom d'utilisateur
            TextField(
              controller: _userCtrl,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Nom d'utilisateur",
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD4AF37)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Champ Mot de passe
            TextField(
              controller: _passCtrl,
              obscureText: true, // Pour cacher le mot de passe
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Mot de passe",
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD4AF37)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            
            // Bouton SE CONNECTER
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _connexion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  "SE CONNECTER",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 25),
            
            // Lien d'inscription
            GestureDetector(
              onTap: () {
                // Action pour s'inscrire (optionnel)
              },
              child: const Text(
                "Pas encore de compte ? S'inscrire",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}