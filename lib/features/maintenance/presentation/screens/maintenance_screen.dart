// lib/features/maintenance/presentation/screens/maintenance_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/maintenance/presentation/widgets/add_maintenance_sheet.dart';

/// StreamProvider watching real-time maintenance logs recorded by the owner.
final maintenanceStreamProvider = StreamProvider((ref) {
  final maintenanceDao = ref.watch(maintenanceDaoProvider);
  return maintenanceDao.watchAllRequests();
});

/// Screen displaying owner-recorded repair logs with live database updates.
class MaintenanceScreen extends ConsumerWidget {
  /// Constructs a [MaintenanceScreen] instance.
  const MaintenanceScreen({super.key});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green.shade100;
      case 'in progress':
        return Colors.blue.shade100;
      default:
        return Colors.orange.shade100;
    }
  }

  void _showAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const AddMaintenanceSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maintenanceAsync = ref.watch(maintenanceStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Maintenance Logs')),
      body: maintenanceAsync.when(
        data: (records) {
          if (records.isEmpty) {
            return const Center(child: Text('No maintenance logs recorded yet.'));
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
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSheet(context),
        tooltip: 'Log Maintenance',
        child: const Icon(Icons.add),
      ),
    );
  }
}