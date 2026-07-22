// lib/app/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:housely/features/assets/presentation/screens/assets_screen.dart';
import 'package:housely/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:housely/features/expenses/presentation/screens/expenses_screen.dart';
import 'package:housely/features/maintenance/presentation/screens/maintenance_screen.dart';
import 'package:housely/features/properties/presentation/screens/properties_screen.dart';
import 'package:housely/features/rent_ledger/presentation/screens/rent_ledger_screen.dart';
import 'package:housely/features/tenants/presentation/screens/tenants_screen.dart';

/// Riverpod [Provider] defining the central [GoRouter] configuration
/// for application-wide declarative routing and navigation.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      /// Core overview dashboard route.
      GoRoute(
        path: '/',
        name: 'dashboard',
        builder: (BuildContext context, GoRouterState state) {
          return const DashboardScreen();
        },
      ),

      /// Property units list and management route.
      GoRoute(
        path: '/properties',
        name: 'properties',
        builder: (BuildContext context, GoRouterState state) {
          return const PropertiesScreen();
        },
      ),

      /// Active and past tenants registry route.
      GoRoute(
        path: '/tenants',
        name: 'tenants',
        builder: (BuildContext context, GoRouterState state) {
          return const TenantsScreen();
        },
      ),

      /// Rent payment historical ledger and receipts route.
      GoRoute(
        path: '/rent-ledger',
        name: 'rent_ledger',
        builder: (BuildContext context, GoRouterState state) {
          return const RentLedgerScreen();
        },
      ),

      /// Property repairs and maintenance tracking route.
      GoRoute(
        path: '/maintenance',
        name: 'maintenance',
        builder: (BuildContext context, GoRouterState state) {
          return const MaintenanceScreen();
        },
      ),

      /// Operational overhead and building expenses route.
      GoRoute(
        path: '/expenses',
        name: 'expenses',
        builder: (BuildContext context, GoRouterState state) {
          return const ExpensesScreen();
        },
      ),

      /// Physical appliances and inventory assets route.
      GoRoute(
        path: '/assets',
        name: 'assets',
        builder: (BuildContext context, GoRouterState state) {
          return const AssetsScreen();
        },
      ),
    ],
  );
});