import 'package:flutter/material.dart';

import '../../constants.dart';

import 'components/otp_form.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  "OTP Verification",
                  style: headingStyle,
                ),
                const Text("We sent your code to +* *** *** ***"),
                TweenAnimationBuilder(
                  tween: Tween(begin: 60.0, end: 0.0),
                  duration: const Duration(seconds: 60),
                  builder: (_, dynamic value, child) {
                    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("The code will expire in "),
                      Text(
                        "${value.toInt()}",
                        style: const TextStyle(color: Colors.red),
                      ),
                      Text(" second${value.toInt() > 1 ? 's' : ''}")
                    ],
                  );
                },
                ),
                const OtpForm(),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // OTP code resend
                  },
                  child: const Text(
                    "Resend OTP Code",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
