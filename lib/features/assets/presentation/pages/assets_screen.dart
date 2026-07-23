// lib/features/assets/presentation/pages/assets_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/database/database_provider.dart';
import 'package:housely/features/assets/presentation/widgets/add_asset_sheet.dart';

/// StreamProvider watching real-time asset inventory from [AssetsDao].
final assetsStreamProvider = StreamProvider((ref) {
  final assetsDao = ref.watch(assetsDaoProvider);
  return assetsDao.watchAllAssets();
});

/// Presentation screen for tracking property inventory items and condition states.
class AssetsScreen extends ConsumerWidget {
  /// Constructs an [AssetsScreen] instance.
  const AssetsScreen({super.key});

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

  void _showAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const AddAssetSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetsAsync = ref.watch(assetsStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Property Assets')),
      body: assetsAsync.when(
        data: (assets) {
          if (assets.isEmpty) {
            return const Center(child: Text('No property assets registered yet.'));
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
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSheet(context),
        tooltip: 'Add Asset',
        child: const Icon(Icons.add),
      ),
    );
  }
}