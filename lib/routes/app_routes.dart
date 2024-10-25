import 'package:boiler_plate/view/screens.dart';
import 'package:boiler_plate/view/screens/form/form_view.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, secondScreen, formScreen }

// flutter packages pub run build_runner build --delete-conflicting-outputs
final routers = [
  GoRoute(
    path: '/',
    name: AppRoute.home.name,
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    path: '/secondScreen',
    name: AppRoute.secondScreen.name,
    builder: (context, state) => const NewsListView(),
  ),
  GoRoute(
    path: '/formScreen',
    name: AppRoute.formScreen.name,
    builder: (context, state) => FormView(),
  ),
];
