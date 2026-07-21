import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/app/providers.dart';
import 'package:housely/core/database/tables.dart';
import 'package:housely/features/auth/presentation/widgets/role_tab_widget.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  UserRole _selectedRole = UserRole.resident;
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    setState(() => _isLoading = true);
    final email = _selectedRole == UserRole.owner
        ? 'owner@housely.com'
        : 'resident.4b@housely.com';

    await ref.read(authStateProvider.notifier).loginMock(email, _selectedRole);
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.apartment_rounded,
                size: 72,
                color: Color(0xFF38BDF8),
              ),
              const SizedBox(height: 16),
              Text(
                'Housely',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Apartment Management System',
                style: TextStyle(color: Color(0xFF94A3B8)),
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    RoleTabWidget(
                      title: 'Resident',
                      isSelected: _selectedRole == UserRole.resident,
                      onTap: () =>
                          setState(() => _selectedRole = UserRole.resident),
                    ),
                    RoleTabWidget(
                      title: 'Owner',
                      isSelected: _selectedRole == UserRole.owner,
                      onTap: () =>
                          setState(() => _selectedRole = UserRole.owner),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF38BDF8),
                    foregroundColor: const Color(0xFF0F172A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isLoading ? null : _handleLogin,
                  child: _isLoading
                      ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : Text(
                    'Continue as ${_selectedRole == UserRole.owner ? "Owner" : "Resident"}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}