// lib/app/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Navigation keys and GoRouter configuration for Housely.
final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Global Riverpod provider exposing the GoRouter routing instance.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'dashboard',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Dashboard Placeholder')),
        ),
      ),
      GoRoute(
        path: '/properties',
        name: 'properties',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Properties Placeholder')),
        ),
      ),
      GoRoute(
        path: '/tenants',
        name: 'tenants',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Tenants Placeholder')),
        ),
      ),
      GoRoute(
        path: '/ledger',
        name: 'ledger',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Rent Ledger Placeholder')),
        ),
      ),
      GoRoute(
        path: '/maintenance',
        name: 'maintenance',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Maintenance Placeholder')),
        ),
      ),
      GoRoute(
        path: '/expenses',
        name: 'expenses',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Expenses Placeholder')),
        ),
      ),
      GoRoute(
        path: '/assets',
        name: 'assets',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Assets Placeholder')),
        ),
      ),
      GoRoute(
        path: '/vault',
        name: 'vault',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Document Vault Placeholder')),
        ),
      ),
    ],
  );
});