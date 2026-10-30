import 'package:flutter/material.dart';

class ExpandedScreen extends StatelessWidget {
  const ExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> transactions = [
      'Monthly salary',
      'Electricity bill',
      'Transfer to savings',
      'Airtime purchase',
      'Transport payment',
      'Internet subscription',
      'Food purchase',
      'Water bill',
      'Toiletry bill',
      'Sport betting bill',
      'Waste management bill',
      'Transportation bill',
    ];

    final List<IconData> transactionIcons = [
      Icons.payments, //Monthly salary
      Icons.bolt,   //Electricity bill
      Icons.savings, //Transfer to savings
      Icons.phone_android, //Airtime purchase
      Icons.directions_bus, //Transport payment
      Icons.wifi, //Internet subscription
      Icons.restaurant, //Food purchase
      Icons.water_drop, //Water bill
      Icons.shopping_bag, //Toiletry bill
      Icons.sports_soccer, //Sport betting bill
      Icons.delete_outline, //Waste management bill
      Icons.local_taxi, //Transportation bill
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account balance',
              style: TextStyle(fontSize:20),
            ),

            const SizedBox(height: 8),

            Card(
              color: Colors.blue.shade900,
              child: const ListTile(
                title: Text(
                  '₦480,500.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Available balance',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ const Text(
                'Recent transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
                Text('${transactions.length} records',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade900,
                ),)
              ],

            ),

            const SizedBox(height: 8),

            Expanded(
              child: ListView.separated(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:  CircleAvatar(
                      backgroundColor: Colors.blue.shade50,
                      child: Icon(transactionIcons[index],
                      color: Colors.blue.shade900,
                      ),
                    ),
                    title: Text(transactions[index]),
                    subtitle: const Text('Successful'),
                    trailing: const Icon(
                      Icons.chevron_right,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(height: 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}