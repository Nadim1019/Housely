// lib/features/assets/presentation/screens/assets_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';

/// Riverpod [StreamProvider] watching real-time property inventory assets from [AssetsDao].
final assetsStreamProvider = StreamProvider((ref) {
  final assetsDao = ref.watch(assetsDaoProvider);
  return assetsDao.watchAllAssets();
});

/// Presentation screen for viewing, categorizing, and managing unit appliances and furniture assets.
class AssetsScreen extends ConsumerWidget {
  /// Constructs an [AssetsScreen] instance.
  const AssetsScreen({super.key});

  /// Maps physical asset condition state to contextual theme badge colors.
  Color _getConditionColor(String condition) {
    switch (condition.toLowerCase()) {
      case 'new':
        return Colors.green.shade100;
      case 'good':
        return Colors.blue.shade100;
      case 'needs repair':
        return Colors.red.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch real-time asset inventory stream state
    final assetsAsync = ref.watch(assetsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Assets'),
      ),
      body: assetsAsync.when(
        // Rendered when database stream successfully emits asset inventory records
        data: (assets) {
          if (assets.isEmpty) {
            return const Center(
              child: Text('No property assets registered yet.'),
            );
          }
          return ListView.builder(
            itemCount: assets.length,
            itemBuilder: (context, index) {
              final asset = assets[index];
              return ListTile(
                leading: const Icon(Icons.devices_other),
                title: Text(asset.assetName),
                subtitle: Text(
                  'Category: ${asset.category}'
                      '${asset.purchasePrice != null ? " | Value: \$${asset.purchasePrice!.toStringAsFixed(2)}" : ""}',
                ),
                trailing: Chip(
                  label: Text(asset.condition),
                  backgroundColor: _getConditionColor(asset.condition),
                ),
              );
            },
          );
        },
        // Rendered during initial asynchronous stream setup
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        // Rendered upon stream error
        error: (err, stack) => Center(
          child: Text('Error: $err'),
        ),
      ),
    );
  }
}