// lib/features/properties/presentation/pages/properties_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/properties/presentation/widgets/add_property_sheet.dart';

/// Riverpod stream provider watching real-time updates for all property records.
final propertiesStreamProvider = StreamProvider((ref) {
  final propertiesDao = ref.watch(propertiesDaoProvider);
  return propertiesDao.watchAllProperties();
});

/// Screen component displaying an active property overview with creation triggers.
///
/// Listens to [propertiesStreamProvider] for real-time reactivity and presents
/// details within card containers aligned with the application theme.
class PropertiesScreen extends ConsumerWidget {
  /// Constructs a [PropertiesScreen] instance.
  const PropertiesScreen({super.key});

  /// Displays the modal bottom sheet to insert new property details.
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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Properties')),
      body: propertiesAsync.when(
        data: (properties) {
          if (properties.isEmpty) {
            return const Center(child: Text('No properties found. Add one below!'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: properties.length,
            itemBuilder: (context, index) {
              final property = properties[index];
              final isOccupied = property.isOccupied;

              return Card(
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(
                    color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(
                          Icons.apartment,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              property.name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              property.address,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.outline,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              'Rent: \$${property.monthlyRent.toStringAsFixed(2)}/mo',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Chip(
                        label: Text(
                          isOccupied ? 'Occupied' : 'Vacant',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: isOccupied
                                ? theme.colorScheme.onTertiaryContainer
                                : theme.colorScheme.onErrorContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        backgroundColor: isOccupied
                            ? theme.colorScheme.tertiaryContainer
                            : theme.colorScheme.errorContainer,
                        side: BorderSide.none,
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
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