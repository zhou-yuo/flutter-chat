import 'package:go_router/go_router.dart';
import '../pages/layout/layout.dart';
// import '../pages/contact/contact.dart';
// import '../pages/user/user.dart';
import '../pages/chat/chat.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LayoutPage(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatPage(),
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
