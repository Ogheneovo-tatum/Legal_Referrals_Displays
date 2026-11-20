import 'package:material_ui/material_ui.dart';

class RefreshIndicatorScreen extends StatefulWidget {
  const RefreshIndicatorScreen({super.key});

  @override
  State<RefreshIndicatorScreen> createState() =>
      _RefreshIndicatorScreenState();
}

class _RefreshIndicatorScreenState
    extends State<RefreshIndicatorScreen> {

  // Our sample transaction data.
  final List<String> transactions = [
    'Monthly salary',
    'Electricity bill',
    'Transfer to savings',
    'Airtime purchase',
    'Transport payment',
    'Internet subscription',
  ];

  // Function that runs when the user pulls down.
  Future<void> refreshTransactions() async {

    // Simulate waiting for an API response.
    await Future.delayed(
      const Duration(seconds: 2),
    );

    // Make sure the screen is still active.
    if (!mounted) return;

    // Update the transaction list.
    setState(() {
      transactions.insert(
        0,
        'Hair payment',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: RefreshIndicator(
        color: Colors.blue,
        backgroundColor: Colors.white,
        displacement: 50,
        strokeWidth: 3,

        onRefresh: refreshTransactions,

        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),

          itemCount: transactions.length,

          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.receipt_long),
              ),

              title: Text(
                transactions[index],
              ),

              subtitle: const Text(
                'Successful',
              ),

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
    );
  }
}