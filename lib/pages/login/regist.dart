import 'dart:ui';

import 'package:flutter/material.dart';

import './components/common_input.dart';
import './components/common_btn.dart';
import '../../components/backdrop_filter_blur/backdrop_filter_blur.dart';

import '../../utils/shared.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  // 推荐码
  final TextEditingController referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('注册'),
      // ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/chat_bg.jpg'),
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: Center(
            child: BackdropFilterBlur(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 380,
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     color: Color.fromRGBO(0, 0, 0, 0.5),
                  //     offset: Offset(4, 4),
                  //     blurRadius: 4,
                  //   )
                  // ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '注册',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    LoginInput(accountController, hintText: '请输入账号'),
                    const SizedBox(height: 15),
                    LoginInput(pwdController, hintText: '请输入密码'),
                    const SizedBox(height: 15),
                    LoginInput(referralCodeController, hintText: '请输入推荐码'),
                    const SizedBox(height: 15),
                    const LoginBtn('注册'),
                    const SizedBox(height: 10),
                    LoginBtn(
                      '登录',
                      type: LoginButtonType.outline,
                      handleTap: () => Shared.toLogin(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
