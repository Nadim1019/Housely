// lib/features/dashboard/presentation/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      body: metricsAsync.when(
        data: (metrics) => DashboardGridView(metrics: metrics),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}