import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/init_screen.dart';
import 'package:shop_app/state_managements/auth.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Login Success"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Image.asset(
            "assets/images/success.png",
            width: MediaQuery.of(context).size.width
          ),
          const SizedBox(height: 16),
          const Text(
            "Login Success",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                (() async {
                  await context.read<Auth>().setIsLoggedIn(true);
                  log('Auth state was updated${context.mounted ? ' to ${context.read<Auth>().isLoggedIn}' : ''}');
                })();
                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(context, InitScreen.routeName, (route) => false);
                } else {
                  log('error');
                }
              },
              child: const Text("Back to home"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
