import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/app/providers.dart';
import 'package:housely/app/theme/app_theme.dart';
import 'package:housely/features/dashboard/presentation/widgets/owner_stat_card.dart';

class OwnerDashboardShell extends ConsumerWidget {
  const OwnerDashboardShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Portal (${user?.name ?? ""})'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () => ref.read(authStateProvider.notifier).logout(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Property Overview',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                OwnerStatCard(
                  title: 'Collected Rent',
                  value: '\$12,400',
                  color: AppColors.emerald,
                ),
                SizedBox(width: 12),
                OwnerStatCard(
                  title: 'Open Tickets',
                  value: '3',
                  color: AppColors.amber,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}