import 'package:go_router/go_router.dart';
import '../pages/home/home.dart';
// import '../pages/contact/contact.dart';
// import '../pages/user/user.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // GoRoute(
    //   path: '/contact',
    //   pageBuilder: (context, state) => NoTransitionPage<void>(
    //     key: state.pageKey,
    //     child: const ContactPage(),
    //   ),
    // ),
    // GoRoute(
    //   path: '/user',
    //   pageBuilder: (context, state) => NoTransitionPage<void>(
    //     key: state.pageKey,
    //     child: const UserPage(),
    //   ),
    // )
  ],
);
