import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:housely/app/providers.dart';
import 'package:housely/core/database/tables.dart';
import 'package:housely/features/auth/presentation/login_screen.dart';
import 'package:housely/features/dashboard/presentation/owner_dashboard_shell.dart';
import 'package:housely/features/dashboard/presentation/resident_dashboard_shell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (BuildContext context, GoRouterState state) {
      final user = authState.value;
      final isLoggingIn = state.matchedLocation == '/login';

      if (user == null) {
        return isLoggingIn ? null : '/login';
      }

      if (isLoggingIn) {
        return user.role == UserRole.owner ? '/owner' : '/resident';
      }

      if (state.matchedLocation.startsWith('/owner') &&
          user.role != UserRole.owner) {
        return '/resident';
      }

      if (state.matchedLocation.startsWith('/resident') &&
          user.role != UserRole.resident) {
        return '/owner';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/owner',
        builder: (context, state) => const OwnerDashboardShell(),
      ),
      GoRoute(
        path: '/resident',
        builder: (context, state) => const ResidentDashboardShell(),
      ),
    ],
  );
});