// lib/features/tenants/presentation/screens/tenants_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/tenants/presentation/widgets/add_tenant_sheet.dart';

/// StreamProvider watching real-time updates for all registered tenants.
final tenantsStreamProvider = StreamProvider((ref) {
  final tenantsDao = ref.watch(tenantsDaoProvider);
  return tenantsDao.watchAllTenants();
});

/// Screen displaying active tenants with real-time updates and entry trigger.
class TenantsScreen extends ConsumerWidget {
  /// Constructs a [TenantsScreen] instance.
  const TenantsScreen({super.key});

  void _showAddTenantSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const AddTenantSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tenantsAsync = ref.watch(tenantsStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tenants')),
      body: tenantsAsync.when(
        data: (tenants) {
          if (tenants.isEmpty) {
            return const Center(child: Text('No tenants registered. Add one below!'));
          }
          return ListView.builder(
            itemCount: tenants.length,
            itemBuilder: (context, index) {
              final tenant = tenants[index];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(tenant.fullName),
                subtitle: Text('Phone: ${tenant.phoneNumber}\nUnit ID: ${tenant.propertyId}'),
                isThreeLine: true,
                trailing: Text('\$${tenant.securityDeposit.toStringAsFixed(2)}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTenantSheet(context),
        tooltip: 'Add Tenant',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}