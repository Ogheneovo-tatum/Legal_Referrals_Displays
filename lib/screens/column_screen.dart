import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'My banking shortcuts',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Transfer'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Pay bills'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Buy airtime'),
            ),
          ],
        ),
      ),
    );
  }
}