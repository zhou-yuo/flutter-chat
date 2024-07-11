import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import '../utils/shared_manage.dart';

import '../pages/login/login.dart';
import '../pages/login/regist.dart';
import '../pages/login/forget_password.dart';
import '../pages/layout/layout.dart';
import '../pages/chat/chat.dart';
import '../pages/details/details.dart';

final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final bool isLogin = SharedManager().isLogin();
    // 白名单
    const whiteList = ['/login', '/regist', '/forgetPassword'];
    if (!isLogin && !whiteList.contains(state.fullPath)) {
      debugPrint('to login');
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
      path: '/forgetPassword',
      builder: (context, state) => const ForgetPasswordPage(),
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
