import 'package:boiler_plate/routes/app_routes.dart';
import 'package:boiler_plate/services/navigation_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: routers,
    observers: [
      NavigationHistoryObserver(),
    ],
    // urlPathStrategy: UrlPathStrategy.path,
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      );
    },
  );
});
