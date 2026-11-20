import 'package:material_ui/material_ui.dart';

class DismissibleScreen extends StatefulWidget {
  const DismissibleScreen({super.key});

  @override
  State<DismissibleScreen> createState() =>
      _DismissibleScreenState();
}

class _DismissibleScreenState extends State<DismissibleScreen> {

  final List<_BankNotification> notifications = [
    const _BankNotification(
      id: 'notification-1',
      title: 'Money received',
      message: 'You received ₦50,000.',
    ),
    const _BankNotification(
      id: 'notification-2',
      title: 'Electricity payment',
      message: 'Your electricity bill was paid successfully.',
    ),
    const _BankNotification(
      id: 'notification-3',
      title: 'Transfer successful',
      message: 'Your transfer of ₦20,000 was successful.',
    ),
    const _BankNotification(
      id: 'notification-4',
      title: 'Airtime purchase',
      message: 'Your airtime purchase was successful.',
    ),
    const _BankNotification(
      id: 'notification-5',
      title: 'Savings reminder',
      message: 'Remember to save towards your goal.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: notifications.isEmpty
          ? const Center(
        child: Text('No notifications remaining.'),
      )
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,

        itemBuilder: (context, index) {
          final notification = notifications[index];

          return Dismissible(
            key: ValueKey(notification.id),
            direction: DismissDirection.endToStart,

            background: Container(
              color: Colors.transparent,
            ),

            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              color: Colors.blue,
              child: const Icon(
                Icons.archive,
                color: Colors.white,
              ),
            ),

            onDismissed: (direction) {
              setState(() {
                notifications.remove(notification);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${notification.title} dismissed',
                  ),
                ),
              );
            },

            child: Card(
              margin: EdgeInsets.zero,
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.notifications),
                ),
                title: Text(notification.title),
                subtitle: Text(notification.message),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          );
        },

        separatorBuilder: (context, index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
}

class _BankNotification {
  final String id;
  final String title;
  final String message;

  const _BankNotification({
    required this.id,
    required this.title,
    required this.message,
  });
}