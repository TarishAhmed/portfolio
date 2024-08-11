import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/core/theme_data.dart';
import 'package:portfolio/core/theme_provider.dart';
import 'package:portfolio/first_page/first_page_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeStateProvider);
    return MaterialApp(
      title: 'Tarish Ahmed B - Portfolio',
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: themeState ? ThemeMode.dark : ThemeMode.light,
      home: const PortfolioHomePage(),
    );
  }
}
