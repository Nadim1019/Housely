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

/// Combined Riverpod provider streaming aggregate dashboard metrics.
final dashboardMetricsProvider = StreamProvider<DashboardMetrics>((ref) async* {
  final propertiesDao = ref.watch(propertiesDaoProvider);
  final rentLedgerDao = ref.watch(rentLedgerDaoProvider);
  final maintenanceDao = ref.watch(maintenanceDaoProvider);
  final expensesDao = ref.watch(expensesDaoProvider);

  await for (final properties in propertiesDao.watchAllProperties()) {
    final ledgerEntries = await rentLedgerDao.watchAllLedgerEntries().first;
    final maintenanceLogs = await maintenanceDao.watchAllRequests().first;
    final expenseLogs = await expensesDao.watchAllExpenses().first;

    final totalRent = ledgerEntries.fold<double>(
      0.0,
          (sum, item) => sum + item.amountPaid,
    );

    final totalExpenses = expenseLogs.fold<double>(
      0.0,
          (sum, item) => sum + item.amount,
    );

    final occupied = properties.where((p) => p.isOccupied).length;
    final pendingMaintenance = maintenanceLogs
        .where((m) => m.status.toLowerCase() != 'completed')
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