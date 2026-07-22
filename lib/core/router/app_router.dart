// lib/core/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:housely/core/router/app_routes.dart';
import 'package:housely/core/router/scaffold_with_nav_bar.dart';
import 'package:housely/features/assets/presentation/screens/assets_screen.dart';
import 'package:housely/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:housely/features/expenses/presentation/screens/expenses_screen.dart';
import 'package:housely/features/maintenance/presentation/screens/maintenance_screen.dart';
import 'package:housely/features/properties/presentation/screens/properties_screen.dart';
import 'package:housely/features/rent_ledger/presentation/screens/rent_ledger_screen.dart';
import 'package:housely/features/tenants/presentation/screens/tenants_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

/// Riverpod provider delivering central GoRouter navigation configuration.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.dashboard,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ScaffoldWithNavBar(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.dashboard,
            name: 'dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: AppRoutes.properties,
            name: 'properties',
            builder: (context, state) => const PropertiesScreen(),
          ),
          GoRoute(
            path: AppRoutes.rentLedger,
            name: 'rent_ledger',
            builder: (context, state) => const RentLedgerScreen(),
          ),
          GoRoute(
            path: AppRoutes.maintenance,
            name: 'maintenance',
            builder: (context, state) => const MaintenanceScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.tenants,
        name: 'tenants',
        builder: (context, state) => const TenantsScreen(),
      ),
      GoRoute(
        path: AppRoutes.expenses,
        name: 'expenses',
        builder: (context, state) => const ExpensesScreen(),
      ),
      GoRoute(
        path: AppRoutes.assets,
        name: 'assets',
        builder: (context, state) => const AssetsScreen(),
      ),
    ],
  );
});