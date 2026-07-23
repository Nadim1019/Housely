// lib/features/tenants/presentation/pages/tenants_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/tenants/presentation/widgets/add_tenant_sheet.dart';

/// Screen listing registered tenants with quick addition capability.
class TenantsScreen extends ConsumerWidget {
  /// Constructs a [TenantsScreen] instance.
  const TenantsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tenants Registry')),
      body: StreamBuilder(
        stream: db.select(db.tenantsTable).watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final tenants = snapshot.data ?? [];
          if (tenants.isEmpty) {
            return const Center(child: Text('No tenants found. Tap + to add.'));
          }
          return ListView.builder(
            itemCount: tenants.length,
            itemBuilder: (context, index) {
              final tenant = tenants[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(tenant.fullName),
                subtitle: Text(tenant.phoneNumber),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const AddTenantSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}