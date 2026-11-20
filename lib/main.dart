import 'package:material_ui/material_ui.dart';
import 'screens/home_screen.dart';

void main(){
  runApp(const BankingLearningApp());
}

class BankingLearningApp extends StatelessWidget {
  const BankingLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widget Lessons',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
