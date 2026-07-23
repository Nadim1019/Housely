// lib/core/router/scaffold_with_nav_bar.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:housely/core/router/app_drawer.dart';
import 'package:housely/core/router/app_routes.dart';

/// Navigation scaffold providing a persistent bottom bar and side drawer.
class ScaffoldWithNavBar extends StatelessWidget {
  /// Active screen child rendered inside the shell route.
  final Widget child;

  /// Constructs a [ScaffoldWithNavBar] instance.
  const ScaffoldWithNavBar({super.key, required this.child});

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(AppRoutes.properties)) return 1;
    if (location.startsWith(AppRoutes.rentLedger)) return 2;
    if (location.startsWith(AppRoutes.maintenance)) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(AppRoutes.dashboard);
        break;
      case 1:
        context.go(AppRoutes.properties);
        break;
      case 2:
        context.go(AppRoutes.rentLedger);
        break;
      case 3:
        context.go(AppRoutes.maintenance);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _calculateSelectedIndex(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const AppDrawer(),
      body: SafeArea(
        top: false,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: KeyedSubtree(
            key: ValueKey<int>(currentIndex),
            child: child,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _onItemTapped(index, context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.apartment), label: 'Properties'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Ledger'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Repairs'),
        ],
      ),
    );
  }
}