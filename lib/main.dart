import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'core/routing/app_router.dart';
import 'core/constants/app_colors.dart';

void main() => runApp(
  const ProviderScope(
    child: SkyVisionApp(),
  ),
);

class SkyVisionApp extends ConsumerWidget {
  const SkyVisionApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'SkyVision Control',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appBar,
          elevation: 0,
        ),
      ),
      routerConfig: router,
    );
  }
}