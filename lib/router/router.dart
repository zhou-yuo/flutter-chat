import 'package:go_router/go_router.dart';
import '../pages/home.dart';
import '../pages/user.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/user',
      builder: (context, state) => const UserPage(),
    )
  ],
);
