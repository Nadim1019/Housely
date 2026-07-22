// lib/core/constants/app_strings.dart

/// Centralized class containing all application string constants.
/// Prevents hardcoded strings across presentation widgets and enables
/// easy localization or copy updates.
abstract final class AppStrings {
  // General Application Info
  static const String appName = 'Housely';
  static const String appTagline = 'Property Management System';

  // Navigation Labels
  static const String navDashboard = 'Dashboard';
  static const String navProperties = 'Properties';
  static const String navTenants = 'Tenants';
  static const String navLedger = 'Rent Ledger';
  static const String navMaintenance = 'Maintenance';
  static const String navExpenses = 'Expenses';
  static const String navReports = 'Reports';
  static const String navAssets = 'Assets';
  static const String navVault = 'Document Vault';

  // Dashboard Metrics & Headers
  static const String dashboardTitle = 'Property Overview';
  static const String metricTotalProperties = 'Total Properties';
  static const String metricOccupiedUnits = 'Occupied Units';
  static const String metricVacantUnits = 'Vacant Units';
  static const String metricExpectedRent = 'Expected Rent';
  static const String metricTotalIncome = 'Total Income';
  static const String metricPendingMaintenance = 'Pending Repairs';
  static const String metricMonthlyExpenses = 'Monthly Expenses';

  // Common Actions
  static const String actionAdd = 'Add New';
  static const String actionEdit = 'Edit';
  static const String actionDelete = 'Delete';
  static const String actionSave = 'Save';
  static const String actionCancel = 'Cancel';
  static const String actionFilter = 'Filter';
  static const String actionSearch = 'Search...';
  static const String actionViewAll = 'View All';

  // Common Status Labels
  static const String statusOccupied = 'Occupied';
  static const String statusVacant = 'Vacant';
  static const String statusPaid = 'Paid';
  static const String statusPending = 'Pending';
  static const String statusOverdue = 'Overdue';
  static const String statusInMaintenance = 'In Maintenance';

  // Empty State Fallbacks
  static const String emptyProperties = 'No properties registered yet.';
  static const String emptyTenants = 'No active tenants found.';
  static const String emptyExpenses = 'No expenses recorded for this period.';
  static const String emptyMaintenance = 'No active maintenance records.';
}