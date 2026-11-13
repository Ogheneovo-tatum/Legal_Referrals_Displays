import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_BankingService> services = [
      const _BankingService(
        title: 'Transfer',
        icon: Icons.send,
      ),
      const _BankingService(
        title: 'Airtime',
        icon: Icons.phone_android,
      ),
      const _BankingService(
        title: 'Pay bills',
        icon: Icons.receipt_long,
      ),
      const _BankingService(
        title: 'Buy data',
        icon: Icons.wifi,
      ),
      const _BankingService(
        title: 'Cards',
        icon: Icons.credit_card,
      ),
      const _BankingService(
        title: 'Statements',
        icon: Icons.description,
      ),
      const _BankingService(
        title: 'Beneficiaries',
        icon: Icons.people,
      ),
      const _BankingService(
        title: 'Savings',
        icon: Icons.savings,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to your bank',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Choose a service to continue.',
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 20),

            const Text(
              'Banking services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: GridView.builder(
                itemCount: services.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final service = services[index];

                  return Card(
                    elevation: 2,
                    color: Colors.blue.shade50,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${service.title} selected',
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            service.icon,
                            size: 35,
                            color: Colors.blue.shade900,
                          ),

                          const SizedBox(height: 12),

                          Text(
                            service.title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BankingService {
  final String title;
  final IconData icon;

  const _BankingService({
    required this.title,
    required this.icon,
  });
}