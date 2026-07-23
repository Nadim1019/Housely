// lib/features/rent_ledger/presentation/pages/rent_ledger_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/rent_ledger/presentation/widgets/add_rent_payment_sheet.dart';
import 'package:housely/features/rent_ledger/presentation/widgets/rent_ledger_card.dart';

/// Riverpod stream watching real-time rent ledger entries from [RentLedgerDao].
final rentLedgerStreamProvider = StreamProvider((ref) {
  final rentLedgerDao = ref.watch(rentLedgerDaoProvider);
  return rentLedgerDao.watchAllLedgerEntries();
});

/// Screen component rendering reactive rent payment logs and status badges.
class RentLedgerScreen extends ConsumerWidget {
  /// Constructs a [RentLedgerScreen] instance.
  const RentLedgerScreen({super.key});

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
            padding: const EdgeInsets.all(12.0),
            itemCount: entries.length,
            itemBuilder: (context, index) => RentLedgerCard(entry: entries[index]),
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