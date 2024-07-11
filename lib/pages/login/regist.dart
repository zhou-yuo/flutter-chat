import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import './components/common_input.dart';
import './components/common_btn.dart';
import '../../components/backdrop_filter_blur/backdrop_filter_blur.dart';

import '../../utils/shared_manage.dart';

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

  void handleRegist() {
    final Map form = {
      'account': accountController.text.trim(),
      'password': pwdController.text.trim(),
      'referralCode': referralCodeController.text.trim()
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
    if (!form['referralCode']?.isNotEmpty || form['referralCode'] == null) {
      EasyLoading.showToast('请输入推荐码');
      return;
    }
    SharedManager.toLogin(context);
  }

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
              image: AssetImage('assets/images/bg.jpg'),
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
                  borderRadius: BorderRadius.circular(12),
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
                    LoginInput(pwdController,
                        hintText: '请输入密码', obscureText: true),
                    const SizedBox(height: 15),
                    LoginInput(referralCodeController, hintText: '请输入推荐码'),
                    const SizedBox(height: 15),
                    LoginBtn(
                      '注册',
                      handleTap: handleRegist,
                    ),
                    const SizedBox(height: 10),
                    LoginBtn(
                      '登录',
                      type: LoginButtonType.outline,
                      handleTap: () => SharedManager.toLogin(context),
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
