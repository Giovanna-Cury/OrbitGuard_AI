import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  void _showAlertDetails(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081120),
      appBar: AppBar(
        title: const Text('Alertas Ambientais'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.warning, color: Colors.red),
            title: const Text('Risco de Queimadas'),
            subtitle: const Text('Alta temperatura e baixa umidade.'),
            onTap: () {
              _showAlertDetails(
                context,
                title: 'Risco de Queimadas',
                description:
                    'O ambiente apresenta calor elevado e umidade baixa. Verifique pontos de ignição e monitore os sensores de fogo.',
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.flood, color: Colors.blue),
            title: const Text('Alerta de Enchente'),
            subtitle: const Text('Chuvas intensas detectadas.'),
            onTap: () {
              _showAlertDetails(
                context,
                title: 'Alerta de Enchente',
                description:
                    'Chuvas fortes podem elevar níveis de água em rios e áreas baixas. Prepare rotas de evacuação e monitoramento da bacia.',
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.air, color: Colors.orange),
            title: const Text('Qualidade do Ar Ruim'),
            subtitle: const Text('Níveis elevados de poluição.'),
            onTap: () {
              _showAlertDetails(
                context,
                title: 'Qualidade do Ar Ruim',
                description:
                    'Os sensores de partículas finas estão acima do limite aceitável. Recomenda-se uso de máscara e evacuação de áreas sensíveis.',
              );
            },
          ),
        ],
      ),
    );
  }
}
