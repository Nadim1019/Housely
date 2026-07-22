// lib/features/maintenance/presentation/screens/maintenance_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';

/// Riverpod [StreamProvider] that watches and broadcasts real-time updates for all
/// logged property maintenance requests via [MaintenanceDao.watchAllRequests].
final maintenanceStreamProvider = StreamProvider((ref) {
  final maintenanceDao = ref.watch(maintenanceDaoProvider);
  return maintenanceDao.watchAllRequests();
});

/// Presentation widget displaying the list of maintenance, repair requests,
/// assigned technicians, and resolution costs for property managers.
class MaintenanceScreen extends ConsumerWidget {
  /// Constructs a [MaintenanceScreen] instance.
  const MaintenanceScreen({super.key});

  /// Maps a repair status string (e.g., 'Completed', 'In Progress', 'Pending')
  /// to its designated theme color indicator.
  ///
  /// Returns a custom [Color] shade based on the status provided.
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green.shade100;
      case 'in progress':
        return Colors.blue.shade100;
      case 'pending':
      default:
        return Colors.orange.shade100;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch real-time stream of maintenance records from Riverpod state
    final maintenanceAsync = ref.watch(maintenanceStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance & Repairs'),
      ),
      body: maintenanceAsync.when(
        // Rendered when database stream successfully emits maintenance records
        data: (records) {
          if (records.isEmpty) {
            return const Center(
              child: Text('No maintenance records reported.'),
            );
          }
          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return ListTile(
                leading: const Icon(Icons.build_circle_outlined),
                title: Text(record.problemDescription),
                subtitle: Text(
                  'Cost: \$${record.cost}'
                      '${record.technicianInfo != null ? " | Tech: ${record.technicianInfo}" : ""}',
                ),
                trailing: Chip(
                  label: Text(record.status),
                  backgroundColor: _getStatusColor(record.status),
                ),
              );
            },
          );
        },
        // Rendered while initial database read is pending
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        // Rendered when database stream encounters an error
        error: (err, stack) => Center(
          child: Text('Error: $err'),
        ),
      ),
    );
  }
}