import 'package:flutter/material.dart';

class WrapScreen extends StatelessWidget {
  const WrapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to your bank',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                'What would you like to do today?',
                style: TextStyle(fontSize: 15),
              ),

              const SizedBox(height: 20),

              const Text(
                'Quick actions',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildAction('Transfer'),
                  _buildAction('Airtime'),
                  _buildAction('Pay bills'),
                  _buildAction('Buy data'),
                  _buildAction('Card services'),
                  _buildAction('Account statement'),
                  _buildAction('Beneficiaries'),
                  _buildAction('Standing orders'),
                  _buildAction('Loans'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAction(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blue.shade900,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
