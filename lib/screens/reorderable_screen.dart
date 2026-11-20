import 'package:material_ui/material_ui.dart';

class ReorderableScreen extends StatefulWidget {
  const ReorderableScreen({super.key});

  @override
  State<ReorderableScreen> createState() =>
      _ReorderableScreenState();
}

class _ReorderableScreenState extends State<ReorderableScreen> {

  // Our banking services.
  final List<String> services = [
    'Transfer',
    'Airtime',
    'Pay bills',
    'Buy data',
    'Cards',
    'Savings',
  ];

  // Function to rearrange the services.
  void reorderServices(int oldIndex, int newIndex) {

    setState(() {

      // Adjust the destination index when moving down.
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      // Remove the selected item.
      final String service = services.removeAt(oldIndex);

      // Insert it into its new position.
      services.insert(newIndex, service);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReorderableListView'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'My Banking Services',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Drag the handle to rearrange your services.',
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ReorderableListView.builder(

                itemCount: services.length,

                buildDefaultDragHandles: false,

                onReorderItem: reorderServices,

                itemBuilder: (context, index) {

                  final service = services[index];

                  return Card(
                    key: ValueKey(service),
                    margin: const EdgeInsets.only(bottom: 10),

                    child: ListTile(

                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade200,
                        child: Text('${index + 1}'),
                      ),

                      title: Text(
                        service,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      trailing: ReorderableDragStartListener(
                        index: index,
                        child: const Icon(
                          Icons.drag_handle,
                          size: 28,
                        ),
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