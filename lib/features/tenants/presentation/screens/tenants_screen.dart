// lib/features/tenants/presentation/screens/tenants_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';

/// StreamProvider for real-time observation of all tenant records.
final tenantsStreamProvider = StreamProvider((ref) {
  final tenantsDao = ref.watch(tenantsDaoProvider);
  return tenantsDao.watchAllTenants();
});

/// Screen component displaying active tenant profiles and lease details.
class TenantsScreen extends ConsumerWidget {
  const TenantsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tenantsAsync = ref.watch(tenantsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenants'),
      ),
      body: tenantsAsync.when(
        data: (tenants) {
          if (tenants.isEmpty) {
            return const Center(
              child: Text('No tenants found.'),
            );
          }
          return ListView.builder(
            itemCount: tenants.length,
            itemBuilder: (context, index) {
              final tenant = tenants[index];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(tenant.fullName),
                subtitle: Text('Phone: ${tenant.phoneNumber} | Deposit: \$${tenant.securityDeposit}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Lease Ends:',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '${tenant.leaseEndDate.day}/${tenant.leaseEndDate.month}/${tenant.leaseEndDate.year}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}