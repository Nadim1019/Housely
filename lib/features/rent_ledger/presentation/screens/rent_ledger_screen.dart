// lib/features/rent_ledger/presentation/screens/rent_ledger_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';

/// StreamProvider for real-time observation of all rent ledger payment records.
final rentLedgerStreamProvider = StreamProvider((ref) {
  final rentLedgerDao = ref.watch(rentLedgerDaoProvider);
  return rentLedgerDao.watchAllLedgerEntries();
});

/// Screen component displaying payment logs, collection statuses, and financial receipts.
class RentLedgerScreen extends ConsumerWidget {
  const RentLedgerScreen({super.key});

  /// Helper to return appropriate color badges based on payment status.
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return Colors.green.shade100;
      case 'overdue':
        return Colors.red.shade100;
      case 'pending':
      default:
        return Colors.orange.shade100;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ledgerAsync = ref.watch(rentLedgerStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rent Ledger'),
      ),
      body: ledgerAsync.when(
        data: (records) {
          if (records.isEmpty) {
            return const Center(
              child: Text('No rent payment records found.'),
            );
          }
          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return ListTile(
                leading: const Icon(Icons.receipt_long),
                title: Text('Month: ${record.periodMonth}'),
                subtitle: Text(
                  'Paid: \$${record.amountPaid} / Due: \$${record.amountDue}'
                      '${record.paymentMethod != null ? " (${record.paymentMethod})" : ""}',
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
    );
  }
}