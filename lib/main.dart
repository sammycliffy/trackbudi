import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/config/locator/app_locator.dart';
import 'package:trackbudi_vendor/src/config/themes/app_theme.dart';

void main() async {
  setUpLocator();
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  final _router = locator<GoRouter>();
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return MaterialApp.router(
        routerConfig: _router,
        theme: AppTheme.defaultTheme,
      );
    });
  }
}
