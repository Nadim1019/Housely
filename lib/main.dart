// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:housely/core/router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: HouselyApp()));
}

class HouselyApp extends ConsumerWidget {
  const HouselyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Housely',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}