// lib/features/properties/presentation/screens/properties_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';

/// StreamProvider for real-time observation of all properties.
final propertiesStreamProvider = StreamProvider((ref) {
  final propertiesDao = ref.watch(propertiesDaoProvider);
  return propertiesDao.watchAllProperties();
});

/// Screen component displaying property unit list and management options.
class PropertiesScreen extends ConsumerWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = ref.watch(propertiesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
      ),
      body: propertiesAsync.when(
        data: (properties) {
          if (properties.isEmpty) {
            return const Center(
              child: Text('No properties added yet.'),
            );
          }
          return ListView.builder(
            itemCount: properties.length,
            itemBuilder: (context, index) {
              final property = properties[index];
              return ListTile(
                leading: const Icon(Icons.home),
                title: Text(property.name),
                subtitle: Text('${property.address} | Rent: \$${property.monthlyRent}'),
                trailing: Chip(
                  label: Text(property.isOccupied ? 'Occupied' : 'Vacant'),
                  backgroundColor: property.isOccupied
                      ? Colors.lightGreen.shade100
                      : Colors.orange.shade100,
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