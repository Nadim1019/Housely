// lib/features/dashboard/presentation/pages/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/core/database/database_seeder.dart';
import 'package:housely/core/router/app_drawer.dart';
import 'package:housely/features/dashboard/presentation/providers/dashboard_metrics_providers.dart';
import 'package:housely/features/dashboard/presentation/widgets/dashboard_grid_view.dart';

/// Main owner dashboard screen observing live metric updates.
class DashboardScreen extends ConsumerWidget {
  /// Constructs a [DashboardScreen] instance.
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricsAsync = ref.watch(dashboardMetricsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Owner Dashboard')),
      drawer: const AppDrawer(),
      body: metricsAsync.when(
        data: (metrics) => DashboardGridView(metrics: metrics),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.dataset),
        label: const Text('Seed Data'),
        onPressed: () async {
          final db = ref.read(databaseProvider);
          await DatabaseSeeder(db).seedAll();
          ref.invalidate(dashboardMetricsProvider);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Database seeded successfully!')),
            );
          }
        },
      ),
    );
  }
}