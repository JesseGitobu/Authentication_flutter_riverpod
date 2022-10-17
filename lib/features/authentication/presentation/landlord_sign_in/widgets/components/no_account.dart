import 'package:flutter/material.dart';

import '../../../landlord_sign_up/widget/landlord_sign_up_screen.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Dont have an account?',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              fontFamily: 'PT Serif',
              fontSize: 16),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          child: const Text(
            'Register',
            style: TextStyle(
              color: Color.fromARGB(255, 212, 175, 5),
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              fontFamily: 'PT Serif',
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
