import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import '../utils/shared.dart';
import '../pages/login/login.dart';
import '../pages/login/regist.dart';
import '../pages/layout/layout.dart';
import '../pages/chat/chat.dart';
import '../pages/details/details.dart';

final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final bool isLogin = await Shared.isLogin();
    debugPrint('isLogin, $isLogin');
    debugPrint('path, ${state.fullPath}');
    // 白名单
    const whiteList = ['/login', '/regist', '/forgetPassword'];

    if (!isLogin && !whiteList.contains(state.fullPath)) {
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
      path: '/regist',
      builder: (context, state) => const RegistPage(),
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
