// lib/features/maintenance/presentation/pages/maintenance_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/maintenance/presentation/widgets/add_maintenance_sheet.dart';

/// Screen component rendering reactive repair logs and maintenance ticket statuses.
///
/// Listens to real-time streams from [MaintenanceTable] via [StreamBuilder] and
/// provides UI entry points to report new issues via [AddMaintenanceSheet].
class MaintenanceScreen extends ConsumerWidget {
  /// Constructs a [MaintenanceScreen] instance.
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Repairs & Maintenance')),
      body: StreamBuilder(
        stream: db.select(db.maintenanceTable).watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final tickets = snapshot.data ?? [];
          if (tickets.isEmpty) {
            return const Center(child: Text('No maintenance tickets open. Tap + to report.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final item = tickets[index];
              return Card(
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(
                    color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(
                          Icons.build,
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.problemDescription,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Cost: \$${item.cost.toStringAsFixed(2)}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Chip(
                        label: Text(
                          item.status,
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        backgroundColor: theme.colorScheme.surfaceContainerHighest,
                        side: BorderSide.none,
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const AddMaintenanceSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}