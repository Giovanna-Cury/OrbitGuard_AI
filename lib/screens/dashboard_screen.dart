import 'package:flutter/material.dart';

import 'package:gsgi_flutter/screens/alert_screen.dart';
import 'package:gsgi_flutter/screens/map_screen.dart';
import 'package:gsgi_flutter/screens/shelter_screen.dart';
import 'package:gsgi_flutter/widgets/dashboard_widgets.dart';
import 'package:gsgi_flutter/screens/login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081120),
      appBar: AppBar(
        title: const Text('OrbitGuard AI'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.satellite_alt,
                    color: Colors.greenAccent,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'OrbitGuard AI',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Mapa Inteligente'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.warning),
              title: const Text('Alertas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlertScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shield),
              title: const Text('Abrigos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShelterScreen(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () {
                // close drawer then replace route with a fresh LoginScreen
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dashboard Ambiental',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    child: InfoCard(
                      title: 'Temperatura',
                      value: '38°C',
                      icon: Icons.thermostat,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: InfoCard(
                      title: 'Umidade',
                      value: '29%',
                      icon: Icons.water_drop,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Expanded(
                    child: InfoCard(
                      title: 'Qualidade do Ar',
                      value: 'Ruim',
                      icon: Icons.air,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: InfoCard(
                      title: 'Risco',
                      value: 'ALTO',
                      icon: Icons.warning,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Alertas Recentes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const AlertCard(
                title: 'Risco de Queimadas',
                subtitle: 'Temperatura elevada e baixa umidade.',
                color: Colors.redAccent,
              ),
              const AlertCard(
                title: 'Possível Enchente',
                subtitle: 'Chuva intensa prevista para próximas horas.',
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
