// lib/core/router/app_drawer.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:housely/core/router/app_routes.dart';

/// Navigation drawer widget providing access to secondary portal modules.
class AppDrawer extends StatelessWidget {
  /// Constructs an [AppDrawer] instance.
  const AppDrawer({super.key});

  Widget _buildTile(
      BuildContext context, {
        required String title,
        required IconData icon,
        required String route,
      }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close drawer
        context.go(route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const Text(
              'Housely Admin',
              style: TextStyle(color: Colors.white, fontSize: 22.0),
            ),
          ),
          _buildTile(
            context,
            title: 'Tenants Registry',
            icon: Icons.people,
            route: AppRoutes.tenants,
          ),
          _buildTile(
            context,
            title: 'Expenses Log',
            icon: Icons.receipt,
            route: AppRoutes.expenses,
          ),
          _buildTile(
            context,
            title: 'Property Assets',
            icon: Icons.inventory_2,
            route: AppRoutes.assets,
          ),
          _buildTile(
            context,
            title: 'Document Vault',
            icon: Icons.folder_shared,
            route: AppRoutes.documents,
          ),
          _buildTile(
            context,
            title: 'Tenancy History',
            icon: Icons.history_edu,
            route: AppRoutes.history,
          ),
        ],
      ),
    );
  }
}