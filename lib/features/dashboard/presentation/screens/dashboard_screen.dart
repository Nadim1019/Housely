// lib/features/dashboard/presentation/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Central dashboard view providing quick navigation cards to all core modules.
class DashboardScreen extends ConsumerWidget {
  /// Constructs a [DashboardScreen] instance.
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Housely Dashboard'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Property Overview & Navigation',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            _DashboardCard(
              icon: Icons.apartment,
              title: 'Properties',
              subtitle: 'Manage property units and occupancy status',
              onTap: () => context.push('/properties'),
            ),
            _DashboardCard(
              icon: Icons.people,
              title: 'Tenants',
              subtitle: 'View active tenants and lease details',
              onTap: () => context.push('/tenants'),
            ),
            _DashboardCard(
              icon: Icons.receipt_long,
              title: 'Rent Ledger',
              subtitle: 'Track rent payments, due dates, and receipts',
              onTap: () => context.push('/rent-ledger'),
            ),
            _DashboardCard(
              icon: Icons.build_circle_outlined,
              title: 'Maintenance',
              subtitle: 'Monitor property repairs and technician logs',
              onTap: () => context.push('/maintenance'),
            ),
            _DashboardCard(
              icon: Icons.receipt,
              title: 'Expenses',
              subtitle: 'Track operational expenses and costs',
              onTap: () => context.push('/expenses'),
            ),
            _DashboardCard(
              icon: Icons.devices_other,
              title: 'Assets',
              subtitle: 'Manage appliances, furniture, and warranties',
              onTap: () => context.push('/assets'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable navigation card widget for dashboard features.
class _DashboardCard extends StatelessWidget {
  /// Icon representing the feature section.
  final IconData icon;

  /// Display title for the card.
  final String title;

  /// Brief descriptive subtitle.
  final String subtitle;

  /// Callback executed when card is tapped.
  final VoidCallback onTap;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: Icon(icon, size: 32.0),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}