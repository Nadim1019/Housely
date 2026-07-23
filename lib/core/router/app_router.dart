// lib/core/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:housely/core/router/app_routes.dart';
import 'package:housely/core/router/scaffold_with_nav_bar.dart';
import 'package:housely/features/assets/presentation/pages/assets_screen.dart';
import 'package:housely/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:housely/features/documents/presentation/pages/documents_screen.dart';
import 'package:housely/features/expenses/presentation/pages/expenses_screen.dart';
import 'package:housely/features/maintenance/presentation/pages/maintenance_screen.dart';
import 'package:housely/features/properties/presentation/pages/properties_screen.dart';
import 'package:housely/features/rent_ledger/presentation/pages/rent_ledger_screen.dart';
import 'package:housely/features/tenant_history/presentation/pages/tenant_history_screen.dart';
import 'package:housely/features/tenants/presentation/pages/tenants_screen.dart';

/// Navigator keys for nested ShellRoute orchestration.
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

/// Central Riverpod provider delivering GoRouter route mapping.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.dashboard,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ScaffoldWithNavBar(child: child),
        routes: [
          GoRoute(path: AppRoutes.dashboard, builder: (c, s) => const DashboardScreen()),
          GoRoute(path: AppRoutes.properties, builder: (c, s) => const PropertiesScreen()),
          GoRoute(path: AppRoutes.rentLedger, builder: (c, s) => const RentLedgerScreen()),
          GoRoute(path: AppRoutes.maintenance, builder: (c, s) => const MaintenanceScreen()),
          GoRoute(path: AppRoutes.tenants, builder: (c, s) => const TenantsScreen()),
          GoRoute(path: AppRoutes.expenses, builder: (c, s) => const ExpensesScreen()),
          GoRoute(path: AppRoutes.assets, builder: (c, s) => const AssetsScreen()),
          GoRoute(path: AppRoutes.documents, builder: (c, s) => const DocumentsScreen()),
          GoRoute(path: AppRoutes.history, builder: (c, s) => const TenantHistoryScreen()),
        ],
      ),
    ],
  );
});