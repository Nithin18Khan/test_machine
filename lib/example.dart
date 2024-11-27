import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verbat_iot/services/providers/crud_operation.dart';

class SavedDataScreen extends ConsumerWidget {
  const SavedDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the state of saved data using the sharedPreferencesNotifierProvider
    final savedData = ref.watch(sharedPreferencesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Data'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              // Delete data when the delete icon is tapped
              await ref
                  .read(sharedPreferencesNotifierProvider.notifier)
                  .deleteData();
            },
          ),
        ],
      ),
      body: savedData.isEmpty
          ? const Center(child: Text('No data saved yet.'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Saved Data',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Displaying all key-value pairs from savedData
                      ...savedData.entries.map((entry) => _buildDataRow(
                            entry.key,
                            entry.value,
                          )),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  // Helper widget for displaying a row of data
  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
