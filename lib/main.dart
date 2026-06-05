import 'package:flutter/material.dart';

import 'package:gsgi_flutter/screens/login_screen.dart';

void main() {
  runApp(const OrbitGuardAI());
}

class OrbitGuardAI extends StatelessWidget {
  const OrbitGuardAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OrbitGuard AI',
      theme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}
