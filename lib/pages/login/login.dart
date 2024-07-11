import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import './components/common_input.dart';
import './components/common_btn.dart';
import '../../components/backdrop_filter_blur/backdrop_filter_blur.dart';

import '../../utils/shared_manage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  void handleLogin() {
    final Map form = {
      'account': accountController.text.trim(),
      'password': pwdController.text.trim()
    };
    debugPrint('form account ${form['account']}');
    debugPrint('form password ${form['password']}');
    if (!form['account']?.isNotEmpty || form['account'] == null) {
      EasyLoading.showToast('请输入账号');
      return;
    }
    if (!form['password']?.isNotEmpty || form['password'] == null) {
      EasyLoading.showToast('请输入密码');
      return;
    }
    SharedManager().setToken('${DateTime.now().microsecondsSinceEpoch}');
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('登录'),
      // ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: Center(
            child: BackdropFilterBlur(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 350,
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
                      '登录',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    LoginInput(accountController, hintText: '请输入账号'),
                    const SizedBox(height: 15),
                    LoginInput(pwdController,
                        hintText: '请输入密码', obscureText: true),
                    const SizedBox(height: 15),
                    LoginBtn(
                      '登录',
                      handleTap: handleLogin,
                    ),
                    const SizedBox(height: 10),
                    LoginBtn(
                      '注册',
                      type: LoginButtonType.outline,
                      handleTap: () => SharedManager.toRegist(context),
                    ),
                    const SizedBox(height: 10),
                    LoginBtn(
                      '忘记密码',
                      type: LoginButtonType.text,
                      handleTap: () {
                        context.go('/forgetPassword');
                      },
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
