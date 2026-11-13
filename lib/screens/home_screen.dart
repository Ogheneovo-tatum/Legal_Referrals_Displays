import 'package:flutter/material.dart';
import 'expanded_screen.dart';
import 'card_screen.dart';
import 'column_screen.dart';
import 'stack_screen.dart';
import 'wrap_screen.dart';
import 'grid_view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void openScreen(BuildContext context, Widget screen){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Lessons'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Choose a lesson',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          ),
          const SizedBox(height: 16),

          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Card Widget'),
            subtitle: const Text('Savings card example'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => openScreen(context,
                const CardScreen(),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.view_column),
            title: const Text('Column Widget'),
            subtitle: const Text('Arrange widgets vertically'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () =>
              openScreen(context,
                  const ColumnScreen()
              ),
          ),
          ListTile(
            leading: const Icon(Icons.expand),
            title: const Text('Expanded Widget'),
            subtitle: const Text('Use the available space'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => openScreen(context,
                const ExpandedScreen()
            ),
          ),
          ListTile(
            leading: const Icon(Icons.layers),
            title: const Text('Stack Widget'),
            subtitle: const Text('Layer widgets on top of each other'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => openScreen(context,
            const StackScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.wrap_text),
            title: const Text('Wrap Widget'),
            subtitle: Text('Responsive arrangement of widgets'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => openScreen(context,
            const WrapScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('GridView Widget'),
            subtitle: const Text('Display items in rows and columns'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => openScreen(context,
                const GridViewScreen()),
          ),
        ],
      ),
    );
  }
}
