// lib/features/tenant_history/presentation/screens/tenant_history_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/tenant_history/presentation/widgets/add_tenant_history_sheet.dart';

/// StreamProvider watching real-time archived tenancy logs from [TenantHistoryDao].
final tenantHistoryStreamProvider = StreamProvider((ref) {
  final tenantHistoryDao = ref.watch(tenantHistoryDaoProvider);
  return tenantHistoryDao.watchAllHistoryRecords();
});

/// Presentation screen for reviewing past tenancy archives and checkout logs.
class TenantHistoryScreen extends ConsumerWidget {
  /// Constructs a [TenantHistoryScreen] instance.
  const TenantHistoryScreen({super.key});

  void _showAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const AddTenantHistorySheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(tenantHistoryStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tenant History Archives')),
      body: historyAsync.when(
        data: (records) {
          if (records.isEmpty) {
            return const Center(child: Text('No archived tenancy records found.'));
          }
          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return ListTile(
                leading: const Icon(Icons.history_edu),
                title: Text(record.tenantName),
                subtitle: Text(
                  'Unit ID: ${record.propertyId} | Deposit Refunded: \$${record.depositReturned.toStringAsFixed(2)}'
                      '${record.departureNotes != null ? "\nNotes: ${record.departureNotes}" : ""}',
                ),
                isThreeLine: true,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSheet(context),
        tooltip: 'Archive Tenancy',
        child: const Icon(Icons.archive),
      ),
    );
  }
}