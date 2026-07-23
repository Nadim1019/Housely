// lib/features/dashboard/presentation/providers/dashboard_metrics_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';

/// Holds aggregate metrics calculated for the owner dashboard.
class DashboardMetrics {
  final double totalRentCollected;
  final int totalProperties;
  final int occupiedProperties;
  final int pendingMaintenanceCount;
  final double totalMonthlyExpenses;

  const DashboardMetrics({
    required this.totalRentCollected,
    required this.totalProperties,
    required this.occupiedProperties,
    required this.pendingMaintenanceCount,
    required this.totalMonthlyExpenses,
  });

  /// Calculates the occupancy rate percentage.
  double get occupancyRate =>
      totalProperties == 0 ? 0.0 : (occupiedProperties / totalProperties) * 100;
}

/// Combined Riverpod provider streaming aggregate dashboard metrics directly from Drift tables.
final dashboardMetricsProvider = StreamProvider<DashboardMetrics>((ref) async* {
  final db = ref.watch(databaseProvider);

  await for (final properties in db.select(db.propertiesTable).watch()) {
    final ledgerEntries = await db.select(db.rentLedgerTable).get();
    final maintenanceLogs = await db.select(db.maintenanceTable).get();
    final expenseLogs = await db.select(db.expensesTable).get();

    final totalRent = ledgerEntries.fold<double>(
      0.0,
          (sum, item) => sum + (item.amountPaid),
    );

    final totalExpenses = expenseLogs.fold<double>(
      0.0,
          (sum, item) => sum + item.amount,
    );

    final occupied = properties.where((p) => p.isOccupied).length;
    final pendingMaintenance = maintenanceLogs
        .where((m) => (m.status).toLowerCase() != 'completed')
        .length;

    yield DashboardMetrics(
      totalRentCollected: totalRent,
      totalProperties: properties.length,
      occupiedProperties: occupied,
      pendingMaintenanceCount: pendingMaintenance,
      totalMonthlyExpenses: totalExpenses,
    );
  }
});