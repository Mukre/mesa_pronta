import 'package:flutter/material.dart';
import 'package:mesa_pronta/services/authentication_service.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            const Color(0xFFE6B165)), // Definindo a cor do botão
        foregroundColor:
            MaterialStateProperty.all(Colors.white), // Definindo a cor do texto
      ),
      child: Text("Logout"),
    ));
  }
}
