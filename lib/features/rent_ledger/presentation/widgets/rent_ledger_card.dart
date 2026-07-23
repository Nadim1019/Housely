// lib/features/rent_ledger/presentation/widgets/rent_ledger_card.dart

import 'package:flutter/material.dart';

/// Card widget rendering individual rent ledger entry details.
class RentLedgerCard extends StatelessWidget {
  /// The ledger entry record to display.
  final dynamic entry;

  /// Constructs a [RentLedgerCard] instance.
  const RentLedgerCard({super.key, required this.entry});

  Color _getStatusBg(String status, ColorScheme scheme) {
    switch (status.toString().toLowerCase()) {
      case 'paid':
        return scheme.tertiaryContainer;
      case 'pending':
        return scheme.surfaceContainerHighest;
      default:
        return scheme.errorContainer;
    }
  }

  Color _getStatusFg(String status, ColorScheme scheme) {
    switch (status.toString().toLowerCase()) {
      case 'paid':
        return scheme.onTertiaryContainer;
      case 'pending':
        return scheme.onSurfaceVariant;
      default:
        return scheme.onErrorContainer;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final String status = entry.status?.toString() ?? 'Pending';

    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(Icons.receipt_long, color: colorScheme.onPrimaryContainer),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Period: ${entry.periodMonth}',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Tenant #${entry.tenantId} • Unit #${entry.propertyId}',
                    style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.outline),
                  ),
                  if (entry.paymentMethod != null)
                    Text(
                      'Via: ${entry.paymentMethod}',
                      style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.outline),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${(entry.amountPaid as num).toStringAsFixed(2)}',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Chip(
                  label: Text(
                    status,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: _getStatusFg(status, colorScheme),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: _getStatusBg(status, colorScheme),
                  side: BorderSide.none,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}