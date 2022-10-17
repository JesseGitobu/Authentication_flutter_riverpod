import 'package:flutter/material.dart';

import '../../../landlord_sign_up/widget/landlord_sign_up_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Color.fromARGB(255, 212, 175, 5),
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.none,
          fontFamily: 'PT Serif',
          fontSize: 20,
        ),
      ),
    );
  }
}
