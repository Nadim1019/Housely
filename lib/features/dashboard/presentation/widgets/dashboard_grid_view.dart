// lib/features/dashboard/presentation/widgets/dashboard_grid_view.dart

import 'package:flutter/material.dart';
import 'package:housely/features/dashboard/presentation/providers/dashboard_metrics_providers.dart';
import 'package:housely/features/dashboard/presentation/widgets/dashboard_metric_card.dart';

/// Grid widget laying out summary cards from [DashboardMetrics].
class DashboardGridView extends StatelessWidget {
  /// The calculated metrics state to render.
  final DashboardMetrics metrics;

  /// Constructs a [DashboardGridView] instance.
  const DashboardGridView({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16.0),
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      children: [
        DashboardMetricCard(
          title: 'Total Rent Collected',
          value: '\$${metrics.totalRentCollected.toStringAsFixed(2)}',
          icon: Icons.payments,
          color: Colors.green,
        ),
        DashboardMetricCard(
          title: 'Occupancy Rate',
          value: '${metrics.occupancyRate.toStringAsFixed(1)}%',
          icon: Icons.apartment,
          color: Colors.blue,
        ),
        DashboardMetricCard(
          title: 'Pending Repairs',
          value: '${metrics.pendingMaintenanceCount}',
          icon: Icons.build,
          color: Colors.orange,
        ),
        DashboardMetricCard(
          title: 'Total Expenses',
          value: '\$${metrics.totalMonthlyExpenses.toStringAsFixed(2)}',
          icon: Icons.receipt_long,
          color: Colors.red,
        ),
      ],
    );
  }
}