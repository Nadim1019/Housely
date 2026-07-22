// lib/features/rent_ledger/presentation/screens/rent_ledger_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/rent_ledger/presentation/widgets/add_rent_payment_sheet.dart';

/// StreamProvider watching real-time rent ledger entries from [RentLedgerDao].
final rentLedgerStreamProvider = StreamProvider((ref) {
  final rentLedgerDao = ref.watch(rentLedgerDaoProvider);
  return rentLedgerDao.watchAllLedgerEntries();
});

/// Screen component displaying payment entries with real-time updates and log sheet trigger.
class RentLedgerScreen extends ConsumerWidget {
  /// Constructs a [RentLedgerScreen] instance.
  const RentLedgerScreen({super.key});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return Colors.green.shade100;
      case 'pending':
        return Colors.orange.shade100;
      default:
        return Colors.red.shade100;
    }
  }

  void _showAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const AddRentPaymentSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ledgerAsync = ref.watch(rentLedgerStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Rent Ledger')),
      body: ledgerAsync.when(
        data: (entries) {
          if (entries.isEmpty) {
            return const Center(child: Text('No rent records logged yet.'));
          }
          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                leading: const Icon(Icons.receipt_long),
                title: Text('Period: ${entry.periodMonth}'),
                subtitle: Text(
                  'Tenant ID: ${entry.tenantId} | Unit ID: ${entry.propertyId}'
                      '${entry.paymentMethod != null ? " | Via: ${entry.paymentMethod}" : ""}',
                ),
                isThreeLine: true,
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${entry.amountPaid.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    Chip(
                      label: Text(entry.status, style: const TextStyle(fontSize: 10.0)),
                      backgroundColor: _getStatusColor(entry.status),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
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
        tooltip: 'Log Payment',
        child: const Icon(Icons.add),
      ),
    );
  }
}