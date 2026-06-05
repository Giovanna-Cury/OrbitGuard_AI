import 'package:flutter/material.dart';

class ShelterScreen extends StatelessWidget {
  const ShelterScreen({super.key});

  void _openShelterDetail(
    BuildContext context, {
    required String title,
    required String distance,
    required String description,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShelterDetailScreen(
          title: title,
          distance: distance,
          description: description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081120),
      appBar: AppBar(
        title: const Text('Abrigos e Rotas'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Mapa de Abrigos\n(Rota Segura)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Abrigo Central'),
                subtitle: const Text('2.5 km de distância'),
                trailing: ElevatedButton(
                  onPressed: () {
                    _openShelterDetail(
                      context,
                      title: 'Abrigo Central',
                      distance: '2.5 km',
                      description:
                          'Abrigo Central está preparado para acolher pessoas com acesso a água e kits de emergência.',
                    );
                  },
                  child: const Text('Ir'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Abrigo Norte'),
                subtitle: const Text('4 km de distância'),
                trailing: ElevatedButton(
                  onPressed: () {
                    _openShelterDetail(
                      context,
                      title: 'Abrigo Norte',
                      distance: '4 km',
                      description:
                          'Abrigo Norte é uma zona segura com suporte de primeiros socorros e sinalização de rotas.',
                    );
                  },
                  child: const Text('Ir'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShelterDetailScreen extends StatelessWidget {
  const ShelterDetailScreen({
    super.key,
    required this.title,
    required this.distance,
    required this.description,
  });

  final String title;
  final String distance;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081120),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              distance,
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Rota para $title aberta.'),
                  ),
                );
              },
              child: const Text('Iniciar rota'),
            ),
          ],
        ),
      ),
    );
  }
}
