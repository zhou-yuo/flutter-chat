import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import '../utils/shared.dart';
import '../pages/login/login.dart';
import '../pages/layout/layout.dart';
import '../pages/chat/chat.dart';
import '../pages/details/details.dart';

final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final bool isLogin = await Shared.isLogin();
    debugPrint('isLogin, $isLogin');
    if (!isLogin) {
      return '/login';
    } else {
      return null;
    }
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LayoutPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatPage(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => const ContactDetailsPage(),
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
