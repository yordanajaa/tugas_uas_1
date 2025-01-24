import 'package:flutter/material.dart';
import 'navbar.dart';

class AdminScreenWithNavbar extends StatelessWidget {
  const AdminScreenWithNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Navbar(),
    );
  }
}