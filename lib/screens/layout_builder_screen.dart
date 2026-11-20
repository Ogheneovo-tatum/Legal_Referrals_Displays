import 'package:material_ui/material_ui.dart';

class LayoutBuilderScreen extends StatelessWidget {
  const LayoutBuilderScreen({super.key});

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
        title: 'Savings',
        icon: Icons.savings,
      ),
      const _BankingService(
        title: 'Loans',
        icon: Icons.account_balance,
      ),
      const _BankingService(
        title: 'Support',
        icon: Icons.support_agent,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: LayoutBuilder(
          builder: (context, constraints) {

            // Start with two columns.
            int columns = 2;

            // Use four columns on wider screens.
            if (constraints.maxWidth >= 900) {
              columns = 4;
            }

            // Use three columns on medium screens.
            else if (constraints.maxWidth >= 600) {
              columns = 3;
            }

            return Column(
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

                Text(
                  'Banking services ($columns columns)',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Expanded(
                  child: GridView.builder(
                    itemCount: services.length,

                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
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
            );
          },
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