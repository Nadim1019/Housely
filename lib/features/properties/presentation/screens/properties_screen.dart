// lib/features/properties/presentation/screens/properties_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/properties/presentation/widgets/add_property_sheet.dart';

/// Riverpod stream for real-time observation of property records.
final propertiesStreamProvider = StreamProvider((ref) {
  final propertiesDao = ref.watch(propertiesDaoProvider);
  return propertiesDao.watchAllProperties();
});

/// Screen component displaying active properties list with creation trigger.
class PropertiesScreen extends ConsumerWidget {
  /// Constructs a [PropertiesScreen] instance.
  const PropertiesScreen({super.key});

  void _showAddPropertySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const AddPropertySheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = ref.watch(propertiesStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Properties')),
      body: propertiesAsync.when(
        data: (properties) {
          if (properties.isEmpty) {
            return const Center(child: Text('No properties found. Add one below!'));
          }
          return ListView.builder(
            itemCount: properties.length,
            itemBuilder: (context, index) {
              final property = properties[index];
              return ListTile(
                leading: const Icon(Icons.apartment),
                title: Text(property.name),
                subtitle: Text('${property.address}\nRent: \$${property.monthlyRent}'),
                isThreeLine: true,
                trailing: Chip(
                  label: Text(property.isOccupied ? 'Occupied' : 'Vacant'),
                  backgroundColor: property.isOccupied
                      ? Colors.green.shade100
                      : Colors.orange.shade100,
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddPropertySheet(context),
        tooltip: 'Add Property',
        child: const Icon(Icons.add),
      ),
    );
  }
}