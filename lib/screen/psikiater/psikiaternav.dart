import 'package:flutter/material.dart';
import 'package:tugas_uas_1/screen/psikiater/navbar.dart';


class PsikiaterScreenWithNavbar extends StatelessWidget {
  const PsikiaterScreenWithNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Navbar(),
    );
  }
}